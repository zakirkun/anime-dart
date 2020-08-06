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

  final _$loadingAtom = Atom(name: '_WatchEpisodeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
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

  final _$loadEpisodeAsyncAction =
      AsyncAction('_WatchEpisodeStoreBase.loadEpisode');

  @override
  Future<void> loadEpisode(String episodeId) {
    return _$loadEpisodeAsyncAction.run(() => super.loadEpisode(episodeId));
  }

  final _$_WatchEpisodeStoreBaseActionController =
      ActionController(name: '_WatchEpisodeStoreBase');

  @override
  void dispose() {
    final _$actionInfo = _$_WatchEpisodeStoreBaseActionController.startAction(
        name: '_WatchEpisodeStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_WatchEpisodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
episodeDetails: ${episodeDetails},
loading: ${loading},
errorMsg: ${errorMsg}
    ''';
  }
}
