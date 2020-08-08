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

  final _$initializePlayerControllerAsyncAction =
      AsyncAction('_PlayerStoreBase.initializePlayerController');

  @override
  Future<void> initializePlayerController() {
    return _$initializePlayerControllerAsyncAction
        .run(() => super.initializePlayerController());
  }

  @override
  String toString() {
    return '''
videoPlayerController: ${videoPlayerController},
getProgress: ${getProgress},
progress: ${progress},
seconds: ${seconds},
playerOk: ${playerOk}
    ''';
  }
}
