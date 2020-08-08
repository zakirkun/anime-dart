// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_episode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchEpisodeStore on _WatchEpisodeStoreBase, Store {
  final _$episodeDetailsAtom =
      Atom(name: '_WatchEpisodeStoreBase.episodeDetails');

  @override
  EpisodeDetails get episodeDetails {
    _$episodeDetailsAtom.reportRead();
    return super.episodeDetails;
  }

  @override
  set episodeDetails(EpisodeDetails value) {
    _$episodeDetailsAtom.reportWrite(value, super.episodeDetails, () {
      super.episodeDetails = value;
    });
  }

  final _$loadingWatchEpisodeAtom =
      Atom(name: '_WatchEpisodeStoreBase.loadingWatchEpisode');

  @override
  bool get loadingWatchEpisode {
    _$loadingWatchEpisodeAtom.reportRead();
    return super.loadingWatchEpisode;
  }

  @override
  set loadingWatchEpisode(bool value) {
    _$loadingWatchEpisodeAtom.reportWrite(value, super.loadingWatchEpisode, () {
      super.loadingWatchEpisode = value;
    });
  }

  final _$loadingOtherEpisodeAtom =
      Atom(name: '_WatchEpisodeStoreBase.loadingOtherEpisode');

  @override
  bool get loadingOtherEpisode {
    _$loadingOtherEpisodeAtom.reportRead();
    return super.loadingOtherEpisode;
  }

  @override
  set loadingOtherEpisode(bool value) {
    _$loadingOtherEpisodeAtom.reportWrite(value, super.loadingOtherEpisode, () {
      super.loadingOtherEpisode = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_WatchEpisodeStoreBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$episodeIdAtom = Atom(name: '_WatchEpisodeStoreBase.episodeId');

  @override
  String get episodeId {
    _$episodeIdAtom.reportRead();
    return super.episodeId;
  }

  @override
  set episodeId(String value) {
    _$episodeIdAtom.reportWrite(value, super.episodeId, () {
      super.episodeId = value;
    });
  }

  final _$watchEpisodeIdAtom =
      Atom(name: '_WatchEpisodeStoreBase.watchEpisodeId');

  @override
  String get watchEpisodeId {
    _$watchEpisodeIdAtom.reportRead();
    return super.watchEpisodeId;
  }

  @override
  set watchEpisodeId(String value) {
    _$watchEpisodeIdAtom.reportWrite(value, super.watchEpisodeId, () {
      super.watchEpisodeId = value;
    });
  }

  final _$loadEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadEpisode');

  @override
  Future<void> loadEpisode() {
    return _$loadEpisodeAsyncAction.run(() => super.loadEpisode());
  }

  final _$loadNextEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadNextEpisode');

  @override
  Future<void> loadNextEpisode() {
    return _$loadNextEpisodeAsyncAction.run(() => super.loadNextEpisode());
  }

  final _$loadPrevEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadPrevEpisode');

  @override
  Future<void> loadPrevEpisode() {
    return _$loadPrevEpisodeAsyncAction.run(() => super.loadPrevEpisode());
  }

  final _$_WatchEpisodeStoreBaseActionController =
      ActionController(name: '_WatchEpisodeStoreBase');

  @override
  void setWatchEpisodeId(String newEpisodeId) {
    final _$actionInfo = _$_WatchEpisodeStoreBaseActionController.startAction(
        name: '_WatchEpisodeStoreBase.setWatchEpisodeId');
    try {
      return super.setWatchEpisodeId(newEpisodeId);
    } finally {
      _$_WatchEpisodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedEpisode(EpisodeDetails updatedEpisode) {
    final _$actionInfo = _$_WatchEpisodeStoreBaseActionController.startAction(
        name: '_WatchEpisodeStoreBase.renderUpdatedEpisode');
    try {
      return super.renderUpdatedEpisode(updatedEpisode);
    } finally {
      _$_WatchEpisodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodeDetails: ${episodeDetails},
loadingWatchEpisode: ${loadingWatchEpisode},
loadingOtherEpisode: ${loadingOtherEpisode},
errorMsg: ${errorMsg},
episodeId: ${episodeId},
watchEpisodeId: ${watchEpisodeId}
    ''';
  }
}
