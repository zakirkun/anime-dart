// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'central_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CentralStore on _CentralStoreBase, Store {
  final _$animeDetailsListenersAtom =
      Atom(name: '_CentralStoreBase.animeDetailsListeners');

  @override
  ObservableMap<String, AnimeDetailsStore> get animeDetailsListeners {
    _$animeDetailsListenersAtom.reportRead();
    return super.animeDetailsListeners;
  }

  @override
  set animeDetailsListeners(ObservableMap<String, AnimeDetailsStore> value) {
    _$animeDetailsListenersAtom.reportWrite(value, super.animeDetailsListeners,
        () {
      super.animeDetailsListeners = value;
    });
  }

  final _$watchEpisodeListenersAtom =
      Atom(name: '_CentralStoreBase.watchEpisodeListeners');

  @override
  ObservableMap<String, WatchEpisodeStore> get watchEpisodeListeners {
    _$watchEpisodeListenersAtom.reportRead();
    return super.watchEpisodeListeners;
  }

  @override
  set watchEpisodeListeners(ObservableMap<String, WatchEpisodeStore> value) {
    _$watchEpisodeListenersAtom.reportWrite(value, super.watchEpisodeListeners,
        () {
      super.watchEpisodeListeners = value;
    });
  }

  final _$searchListenersAtom = Atom(name: '_CentralStoreBase.searchListeners');

  @override
  ObservableMap<String, SearchStore> get searchListeners {
    _$searchListenersAtom.reportRead();
    return super.searchListeners;
  }

  @override
  set searchListeners(ObservableMap<String, SearchStore> value) {
    _$searchListenersAtom.reportWrite(value, super.searchListeners, () {
      super.searchListeners = value;
    });
  }

  final _$setEpisodeStatsAsyncAction =
      AsyncAction('_CentralStoreBase.setEpisodeStats');

  @override
  Future<void> setEpisodeStats(String episodeId, double newStats) {
    return _$setEpisodeStatsAsyncAction
        .run(() => super.setEpisodeStats(episodeId, newStats));
  }

  final _$setEpisodeFavoriteAsyncAction =
      AsyncAction('_CentralStoreBase.setEpisodeFavorite');

  @override
  Future<void> setEpisodeFavorite(Anime anime, bool newValue) {
    return _$setEpisodeFavoriteAsyncAction
        .run(() => super.setEpisodeFavorite(anime, newValue));
  }

  final _$_CentralStoreBaseActionController =
      ActionController(name: '_CentralStoreBase');

  @override
  String addAnimeDetailsListener(AnimeDetailsStore listener) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.addAnimeDetailsListener');
    try {
      return super.addAnimeDetailsListener(listener);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  AnimeDetailsStore getAnimeDetailsListener(String key) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.getAnimeDetailsListener');
    try {
      return super.getAnimeDetailsListener(key);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAnimeDetailsListener(String key) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.removeAnimeDetailsListener');
    try {
      return super.removeAnimeDetailsListener(key);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String addWatchEpisodeListener(WatchEpisodeStore listener) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.addWatchEpisodeListener');
    try {
      return super.addWatchEpisodeListener(listener);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  WatchEpisodeStore getWatchEpisodeListener(String key) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.getWatchEpisodeListener');
    try {
      return super.getWatchEpisodeListener(key);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeWatchEpisodeListener(String key) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.removeWatchEpisodeListener');
    try {
      return super.removeWatchEpisodeListener(key);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String addSearchListener(SearchStore listener) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.addSearchListener');
    try {
      return super.addSearchListener(listener);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  SearchStore getSearchListener(String key) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.getSearchListener');
    try {
      return super.getSearchListener(key);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSearchListener(String key) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.removeSearchListener');
    try {
      return super.removeSearchListener(key);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispatchNewEpisode(String episodeId, double newStats) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.dispatchNewEpisode');
    try {
      return super.dispatchNewEpisode(episodeId, newStats);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispatchChangeFavorite(Anime anime, bool newValue) {
    final _$actionInfo = _$_CentralStoreBaseActionController.startAction(
        name: '_CentralStoreBase.dispatchChangeFavorite');
    try {
      return super.dispatchChangeFavorite(anime, newValue);
    } finally {
      _$_CentralStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animeDetailsListeners: ${animeDetailsListeners},
watchEpisodeListeners: ${watchEpisodeListeners},
searchListeners: ${searchListeners}
    ''';
  }
}
