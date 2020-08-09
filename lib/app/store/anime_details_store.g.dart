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

  final _$animeDetailsAtom = Atom(name: '_AnimeDetailsStoreBase.animeDetails');

  @override
  AnimeDetails get animeDetails {
    _$animeDetailsAtom.reportRead();
    return super.animeDetails;
  }

  @override
  set animeDetails(AnimeDetails value) {
    _$animeDetailsAtom.reportWrite(value, super.animeDetails, () {
      super.animeDetails = value;
    });
  }

  final _$episodesOfAnimeDetailsAtom =
      Atom(name: '_AnimeDetailsStoreBase.episodesOfAnimeDetails');

  @override
  ObservableList<EpisodeDetails> get episodesOfAnimeDetails {
    _$episodesOfAnimeDetailsAtom.reportRead();
    return super.episodesOfAnimeDetails;
  }

  @override
  set episodesOfAnimeDetails(ObservableList<EpisodeDetails> value) {
    _$episodesOfAnimeDetailsAtom
        .reportWrite(value, super.episodesOfAnimeDetails, () {
      super.episodesOfAnimeDetails = value;
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

  final _$episodeIdPlayingAtom =
      Atom(name: '_AnimeDetailsStoreBase.episodeIdPlaying');

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

  final _$episodeUrlPlayingAtom =
      Atom(name: '_AnimeDetailsStoreBase.episodeUrlPlaying');

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

  final _$animeIdAtom = Atom(name: '_AnimeDetailsStoreBase.animeId');

  @override
  String get animeId {
    _$animeIdAtom.reportRead();
    return super.animeId;
  }

  @override
  set animeId(String value) {
    _$animeIdAtom.reportWrite(value, super.animeId, () {
      super.animeId = value;
    });
  }

  final _$loadAnimeDetailsAsyncAction =
      AsyncAction('_AnimeDetailsStoreBase.loadAnimeDetails');

  @override
  Future<void> loadAnimeDetails() {
    return _$loadAnimeDetailsAsyncAction.run(() => super.loadAnimeDetails());
  }

  final _$toggleFavoriteAsyncAction =
      AsyncAction('_AnimeDetailsStoreBase.toggleFavorite');

  @override
  Future<void> toggleFavorite() {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite());
  }

  final _$_AnimeDetailsStoreBaseActionController =
      ActionController(name: '_AnimeDetailsStoreBase');

  @override
  void setAnimeDetailsId(String newAnimeId) {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.setAnimeDetailsId');
    try {
      return super.setAnimeDetailsId(newAnimeId);
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void renderUpdatedEpisode(String id, double newStats) {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.renderUpdatedEpisode');
    try {
      return super.renderUpdatedEpisode(id, newStats);
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedFavorite(String id, bool newValue) {
    final _$actionInfo = _$_AnimeDetailsStoreBaseActionController.startAction(
        name: '_AnimeDetailsStoreBase.renderUpdatedFavorite');
    try {
      return super.renderUpdatedFavorite(id, newValue);
    } finally {
      _$_AnimeDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animeDetails: ${animeDetails},
episodesOfAnimeDetails: ${episodesOfAnimeDetails},
error: ${error},
internalSearch: ${internalSearch},
filteredEpisodes: ${filteredEpisodes},
showSearch: ${showSearch},
episodeIdPlaying: ${episodeIdPlaying},
episodeUrlPlaying: ${episodeUrlPlaying},
animeId: ${animeId},
searchMode: ${searchMode},
notFoundInternalSearch: ${notFoundInternalSearch},
loading: ${loading}
    ''';
  }
}
