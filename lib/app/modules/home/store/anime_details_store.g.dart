// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimeDetailsStore on _AnimeDetailsStoreBase, Store {
  Computed<bool> _$searchModeComputed;

  @override
  bool get searchMode =>
      (_$searchModeComputed ??= Computed<bool>(() => super.searchMode,
              name: '_AnimeDetailsStoreBase.searchMode'))
          .value;
  Computed<bool> _$notFoundInternalSearchComputed;

  @override
  bool get notFoundInternalSearch => (_$notFoundInternalSearchComputed ??=
          Computed<bool>(() => super.notFoundInternalSearch,
              name: '_AnimeDetailsStoreBase.notFoundInternalSearch'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_AnimeDetailsStoreBase.loading'))
      .value;

  final _$detailsAtom = Atom(name: '_AnimeDetailsStoreBase.details');

  @override
  AnimeDetails get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(AnimeDetails value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$episodesAtom = Atom(name: '_AnimeDetailsStoreBase.episodes');

  @override
  ObservableList<EpisodeDetails> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(ObservableList<EpisodeDetails> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$errorAtom = Atom(name: '_AnimeDetailsStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$internalSearchAtom =
      Atom(name: '_AnimeDetailsStoreBase.internalSearch');

  @override
  String get internalSearch {
    _$internalSearchAtom.reportRead();
    return super.internalSearch;
  }

  @override
  set internalSearch(String value) {
    _$internalSearchAtom.reportWrite(value, super.internalSearch, () {
      super.internalSearch = value;
    });
  }

  final _$filteredEpisodesAtom =
      Atom(name: '_AnimeDetailsStoreBase.filteredEpisodes');

  @override
  ObservableList<EpisodeDetails> get filteredEpisodes {
    _$filteredEpisodesAtom.reportRead();
    return super.filteredEpisodes;
  }

  @override
  set filteredEpisodes(ObservableList<EpisodeDetails> value) {
    _$filteredEpisodesAtom.reportWrite(value, super.filteredEpisodes, () {
      super.filteredEpisodes = value;
    });
  }

  final _$showSearchAtom = Atom(name: '_AnimeDetailsStoreBase.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$loadDetailsAsyncAction =
      AsyncAction('_AnimeDetailsStoreBase.loadDetails');

  @override
  Future loadDetails(String animeId) {
    return _$loadDetailsAsyncAction.run(() => super.loadDetails(animeId));
  }

  final _$toggleFavoriteAsyncAction =
      AsyncAction('_AnimeDetailsStoreBase.toggleFavorite');

  @override
  Future<void> toggleFavorite() {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite());
  }

  final _$setEpisodeStatsAsyncAction =
      AsyncAction('_AnimeDetailsStoreBase.setEpisodeStats');

  @override
  Future<void> setEpisodeStats(String episodeId, double newStats) {
    return _$setEpisodeStatsAsyncAction
        .run(() => super.setEpisodeStats(episodeId, newStats));
  }

  final _$_AnimeDetailsStoreBaseActionController =
      ActionController(name: '_AnimeDetailsStoreBase');

  @override
  dynamic showSearchField(bool yesOrNo) {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.showSearchField');
    try {
      return super.showSearchField(yesOrNo);
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInternalSearch(String keyword) {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.setInternalSearch');
    try {
      return super.setInternalSearch(keyword);
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeSearchMode() {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.closeSearchMode');
    try {
      return super.closeSearchMode();
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterEpisodes() {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.filterEpisodes');
    try {
      return super.filterEpisodes();
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
details: ${details},
episodes: ${episodes},
error: ${error},
internalSearch: ${internalSearch},
filteredEpisodes: ${filteredEpisodes},
showSearch: ${showSearch},
searchMode: ${searchMode},
notFoundInternalSearch: ${notFoundInternalSearch},
loading: ${loading}
    ''';
  }
}
