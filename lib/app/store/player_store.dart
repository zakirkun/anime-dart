import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
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
  bool playerOk;

  @action
  Future<void> initializePlayerController() async {
    if (playerOk != null) {
      return;
    }

    playerOk = false;

    videoPlayerController =
        VideoPlayerController.network(centralStore.episodeUrlPlaying);

    videoPlayerController.addListener(() {
      runInAction(() {
        seconds = videoPlayerController.value.position.inSeconds.toDouble();
      });
    });

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    await videoPlayerController.initialize();
    await videoPlayerController.play();

    runInAction(() {
      getProgress = Utils.interpolate(
          xInterval: [0, videoPlayerController.value.duration.inSeconds * 0.8],
          yInterval: [0, 100]);

      playerOk = true;
    });
  }

  Future<void> destroyPlayer() async {
    playerOk = false;

    progress = getProgress(seconds);

    centralStore.setEpisodeStats(centralStore.episodeIdPlaying, progress);

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    await videoPlayerController.dispose();

    videoPlayerController = null;
    getProgress = null;
    progress = null;
    seconds = null;
    playerOk = null;
  }
}
