import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:flick_video_player/flick_video_player.dart';
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
  VideoPlayerValue get videoPlayerValue =>
      flickManager.flickVideoManager.videoPlayerController.value;

  double Function(double) getProgress;

  double progress;

  double seconds;

  @observable
  String episodeUrlPlaying;

  @observable
  String episodeIdPlaying;

  @observable
  FlickManager flickManager;

  @action
  void setEpisodeDetails(String id, String url) {
    episodeUrlPlaying = url;
    episodeIdPlaying = id;
  }

  void _saveProgress() {
    if (getProgress == null || seconds == null) {
      return;
    }

    progress = getProgress(seconds);

    centralStore?.setEpisodeStats(episodeIdPlaying, progress);
  }

  @action
  Future<void> initializePlayerController() async {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(episodeUrlPlaying),
    );

    flickManager.flickVideoManager.addListener(() {
      if (videoPlayerValue.position != null) {
        seconds = flickManager
            .flickVideoManager.videoPlayerController.value.position.inSeconds
            .toDouble();

        if (seconds.toInt() % 10 == 0) {
          _saveProgress();
        }
      }

      if (getProgress == null && videoPlayerValue.duration != null) {
        getProgress = Utils.interpolate(
          xInterval: [0, videoPlayerValue.duration.inSeconds * 0.8],
          yInterval: [0, 100],
        );
      }
    });

    flickManager.flickControlManager.enterFullscreen();
  }

  Future<void> exitPlayer() async {
    _saveProgress();

    flickManager?.dispose();

    getProgress = null;
    progress = null;
  }
}
