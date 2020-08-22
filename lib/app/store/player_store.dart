import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
part 'player_store.g.dart';

class PlayerStore = _PlayerStoreBase with _$PlayerStore;

abstract class _PlayerStoreBase with Store {
  final centralStore = getIt<CentralStore>();

// ===================
  // PLAYER STATE
// ===================
  @observable
  VideoPlayerController videoPlayerController;

  @observable
  double Function(double) getProgress;

  @observable
  double progress;

  @observable
  double seconds;

  @observable
  ChewieController chewieController;

  @observable
  String episodeUrlPlaying;

  @observable
  String episodeIdPlaying;

  @observable
  bool isMounted;

  @observable
  bool loadingPlayer;

  @action
  void setMounted(bool newValue) {
    isMounted = newValue;
  }

  @action
  void setEpisodeDetails(String id, String url) {
    episodeUrlPlaying = url;
    episodeIdPlaying = id;
  }

  @action
  void _saveProgress() {
    if (getProgress == null || seconds == null) {
      return;
    }

    progress = getProgress(seconds);

    centralStore?.setEpisodeStats(episodeIdPlaying, progress);
  }

  @action
  void nextFiveSeconds() {
    if (videoPlayerController == null) {
      return;
    }

    final currentTime = videoPlayerController.value.position;
    final timeLimit = videoPlayerController.value.duration;
    final nextTime = Duration(seconds: currentTime.inSeconds + 5);

    if (nextTime.inSeconds >= timeLimit.inSeconds) {
      return;
    }

    videoPlayerController.seekTo(nextTime);
  }

  @action
  void backFiveSeconds() {
    if (videoPlayerController == null) {
      return;
    }

    final currentTime = videoPlayerController.value.position;
    final timeLimit = Duration(seconds: 0);
    final nextTime = Duration(seconds: currentTime.inSeconds - 5);

    if (nextTime.inSeconds <= timeLimit.inSeconds) {
      return;
    }

    videoPlayerController.seekTo(nextTime);
  }

  @action
  Future<void> initializePlayerController() async {
    if (isMounted == null || !isMounted) {
      return;
    }

    loadingPlayer = true;

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    videoPlayerController = VideoPlayerController.network(episodeUrlPlaying);

    videoPlayerController.addListener(() {
      runInAction(() {
        seconds = videoPlayerController.value.position.inSeconds.toDouble();
        if (seconds.toInt() % 10 == 0) {
          _saveProgress();
        }
      });
    });

    await videoPlayerController.initialize();
    await videoPlayerController.play();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: videoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: false,
        allowFullScreen: true,
        allowedScreenSleep: false,
        autoInitialize: true,
        fullScreenByDefault: true);

    chewieController.enterFullScreen();

    runInAction(() {
      loadingPlayer = false;
      getProgress = Utils.interpolate(
          xInterval: [0, videoPlayerController.value.duration.inSeconds * 0.8],
          yInterval: [0, 100]);
    });

    runInAction(() {
      loadingPlayer = false;
      if (!isMounted) {
        videoPlayerController?.dispose();
        chewieController?.dispose();
      }
    });
  }

  Future<void> exitPlayer() async {
    _saveProgress();

    await videoPlayerController?.dispose();
    chewieController?.dispose();

    videoPlayerController = null;
    getProgress = null;
    progress = null;
    seconds = null;
  }
}
