// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on _PlayerStoreBase, Store {
  final _$videoPlayerControllerAtom =
      Atom(name: '_PlayerStoreBase.videoPlayerController');

  @override
  VideoPlayerController get videoPlayerController {
    _$videoPlayerControllerAtom.reportRead();
    return super.videoPlayerController;
  }

  @override
  set videoPlayerController(VideoPlayerController value) {
    _$videoPlayerControllerAtom.reportWrite(value, super.videoPlayerController,
        () {
      super.videoPlayerController = value;
    });
  }

  final _$getProgressAtom = Atom(name: '_PlayerStoreBase.getProgress');

  @override
  double Function(double) get getProgress {
    _$getProgressAtom.reportRead();
    return super.getProgress;
  }

  @override
  set getProgress(double Function(double) value) {
    _$getProgressAtom.reportWrite(value, super.getProgress, () {
      super.getProgress = value;
    });
  }

  final _$progressAtom = Atom(name: '_PlayerStoreBase.progress');

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  final _$secondsAtom = Atom(name: '_PlayerStoreBase.seconds');

  @override
  double get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(double value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  final _$playerOkAtom = Atom(name: '_PlayerStoreBase.playerOk');

  @override
  bool get playerOk {
    _$playerOkAtom.reportRead();
    return super.playerOk;
  }

  @override
  set playerOk(bool value) {
    _$playerOkAtom.reportWrite(value, super.playerOk, () {
      super.playerOk = value;
    });
  }

  final _$chewieControllerAtom =
      Atom(name: '_PlayerStoreBase.chewieController');

  @override
  ChewieController get chewieController {
    _$chewieControllerAtom.reportRead();
    return super.chewieController;
  }

  @override
  set chewieController(ChewieController value) {
    _$chewieControllerAtom.reportWrite(value, super.chewieController, () {
      super.chewieController = value;
    });
  }

  final _$episodeUrlPlayingAtom =
      Atom(name: '_PlayerStoreBase.episodeUrlPlaying');

  @override
  String get episodeUrlPlaying {
    _$episodeUrlPlayingAtom.reportRead();
    return super.episodeUrlPlaying;
  }

  @override
  set episodeUrlPlaying(String value) {
    _$episodeUrlPlayingAtom.reportWrite(value, super.episodeUrlPlaying, () {
      super.episodeUrlPlaying = value;
    });
  }

  final _$episodeIdPlayingAtom =
      Atom(name: '_PlayerStoreBase.episodeIdPlaying');

  @override
  String get episodeIdPlaying {
    _$episodeIdPlayingAtom.reportRead();
    return super.episodeIdPlaying;
  }

  @override
  set episodeIdPlaying(String value) {
    _$episodeIdPlayingAtom.reportWrite(value, super.episodeIdPlaying, () {
      super.episodeIdPlaying = value;
    });
  }

  final _$initializePlayerControllerAsyncAction =
      AsyncAction('_PlayerStoreBase.initializePlayerController');

  @override
  Future<void> initializePlayerController() {
    return _$initializePlayerControllerAsyncAction
        .run(() => super.initializePlayerController());
  }

  final _$_PlayerStoreBaseActionController =
      ActionController(name: '_PlayerStoreBase');

  @override
  void setEpisodeDetails(String id, String url) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setEpisodeDetails');
    try {
      return super.setEpisodeDetails(id, url);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videoPlayerController: ${videoPlayerController},
getProgress: ${getProgress},
progress: ${progress},
seconds: ${seconds},
playerOk: ${playerOk},
chewieController: ${chewieController},
episodeUrlPlaying: ${episodeUrlPlaying},
episodeIdPlaying: ${episodeIdPlaying}
    ''';
  }
}
