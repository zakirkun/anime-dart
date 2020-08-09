// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool> _$emptyFavoriteListComputed;

  @override
  bool get emptyFavoriteList => (_$emptyFavoriteListComputed ??= Computed<bool>(
          () => super.emptyFavoriteList,
          name: '_HomeStoreBase.emptyFavoriteList'))
      .value;

  final _$latestsAtom = Atom(name: '_HomeStoreBase.latests');

  @override
  ObservableList<Episode> get latests {
    _$latestsAtom.reportRead();
    return super.latests;
  }

  @override
  set latests(ObservableList<Episode> value) {
    _$latestsAtom.reportWrite(value, super.latests, () {
      super.latests = value;
    });
  }

  final _$loadingLatestsAtom = Atom(name: '_HomeStoreBase.loadingLatests');

  @override
  bool get loadingLatests {
    _$loadingLatestsAtom.reportRead();
    return super.loadingLatests;
  }

  @override
  set loadingLatests(bool value) {
    _$loadingLatestsAtom.reportWrite(value, super.loadingLatests, () {
      super.loadingLatests = value;
    });
  }

  final _$latestsErrorAtom = Atom(name: '_HomeStoreBase.latestsError');

  @override
  String get latestsError {
    _$latestsErrorAtom.reportRead();
    return super.latestsError;
  }

  @override
  set latestsError(String value) {
    _$latestsErrorAtom.reportWrite(value, super.latestsError, () {
      super.latestsError = value;
    });
  }

  final _$trendingAtom = Atom(name: '_HomeStoreBase.trending');

  @override
  ObservableList<Anime> get trending {
    _$trendingAtom.reportRead();
    return super.trending;
  }

  @override
  set trending(ObservableList<Anime> value) {
    _$trendingAtom.reportWrite(value, super.trending, () {
      super.trending = value;
    });
  }

  final _$loadingTrendingAtom = Atom(name: '_HomeStoreBase.loadingTrending');

  @override
  bool get loadingTrending {
    _$loadingTrendingAtom.reportRead();
    return super.loadingTrending;
  }

  @override
  set loadingTrending(bool value) {
    _$loadingTrendingAtom.reportWrite(value, super.loadingTrending, () {
      super.loadingTrending = value;
    });
  }

  final _$trendingErrorAtom = Atom(name: '_HomeStoreBase.trendingError');

  @override
  String get trendingError {
    _$trendingErrorAtom.reportRead();
    return super.trendingError;
  }

  @override
  set trendingError(String value) {
    _$trendingErrorAtom.reportWrite(value, super.trendingError, () {
      super.trendingError = value;
    });
  }

  final _$randomAtom = Atom(name: '_HomeStoreBase.random');

  @override
  ObservableList<Anime> get random {
    _$randomAtom.reportRead();
    return super.random;
  }

  @override
  set random(ObservableList<Anime> value) {
    _$randomAtom.reportWrite(value, super.random, () {
      super.random = value;
    });
  }

  final _$loadingRandomAtom = Atom(name: '_HomeStoreBase.loadingRandom');

  @override
  bool get loadingRandom {
    _$loadingRandomAtom.reportRead();
    return super.loadingRandom;
  }

  @override
  set loadingRandom(bool value) {
    _$loadingRandomAtom.reportWrite(value, super.loadingRandom, () {
      super.loadingRandom = value;
    });
  }

  final _$loadingMoreRandomAtom =
      Atom(name: '_HomeStoreBase.loadingMoreRandom');

  @override
  bool get loadingMoreRandom {
    _$loadingMoreRandomAtom.reportRead();
    return super.loadingMoreRandom;
  }

  @override
  set loadingMoreRandom(bool value) {
    _$loadingMoreRandomAtom.reportWrite(value, super.loadingMoreRandom, () {
      super.loadingMoreRandom = value;
    });
  }

  final _$randomErrorAtom = Atom(name: '_HomeStoreBase.randomError');

  @override
  String get randomError {
    _$randomErrorAtom.reportRead();
    return super.randomError;
  }

  @override
  set randomError(String value) {
    _$randomErrorAtom.reportWrite(value, super.randomError, () {
      super.randomError = value;
    });
  }

  final _$randomLoadingMoreErrorAtom =
      Atom(name: '_HomeStoreBase.randomLoadingMoreError');

  @override
  String get randomLoadingMoreError {
    _$randomLoadingMoreErrorAtom.reportRead();
    return super.randomLoadingMoreError;
  }

  @override
  set randomLoadingMoreError(String value) {
    _$randomLoadingMoreErrorAtom
        .reportWrite(value, super.randomLoadingMoreError, () {
      super.randomLoadingMoreError = value;
    });
  }

  final _$favoritesAtom = Atom(name: '_HomeStoreBase.favorites');

  @override
  ObservableList<Anime> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<Anime> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$loadingFavoritesAtom = Atom(name: '_HomeStoreBase.loadingFavorites');

  @override
  bool get loadingFavorites {
    _$loadingFavoritesAtom.reportRead();
    return super.loadingFavorites;
  }

  @override
  set loadingFavorites(bool value) {
    _$loadingFavoritesAtom.reportWrite(value, super.loadingFavorites, () {
      super.loadingFavorites = value;
    });
  }

  final _$favoritesErrorAtom = Atom(name: '_HomeStoreBase.favoritesError');

  @override
  String get favoritesError {
    _$favoritesErrorAtom.reportRead();
    return super.favoritesError;
  }

  @override
  set favoritesError(String value) {
    _$favoritesErrorAtom.reportWrite(value, super.favoritesError, () {
      super.favoritesError = value;
    });
  }

  final _$loadLatestsAsyncAction = AsyncAction('_HomeStoreBase.loadLatests');

  @override
  Future<void> loadLatests() {
    return _$loadLatestsAsyncAction.run(() => super.loadLatests());
  }

  final _$loadTrendingAsyncAction = AsyncAction('_HomeStoreBase.loadTrending');

  @override
  Future<void> loadTrending() {
    return _$loadTrendingAsyncAction.run(() => super.loadTrending());
  }

  final _$loadRandomAsyncAction = AsyncAction('_HomeStoreBase.loadRandom');

  @override
  Future<void> loadRandom() {
    return _$loadRandomAsyncAction.run(() => super.loadRandom());
  }

  final _$loadMoreRandomAsyncAction =
      AsyncAction('_HomeStoreBase.loadMoreRandom');

  @override
  Future<void> loadMoreRandom() {
    return _$loadMoreRandomAsyncAction.run(() => super.loadMoreRandom());
  }

  final _$loadFavoritesAsyncAction =
      AsyncAction('_HomeStoreBase.loadFavorites');

  @override
  Future<void> loadFavorites() {
    return _$loadFavoritesAsyncAction.run(() => super.loadFavorites());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void renderUpdatedEpisode(String id, double newStats) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.renderUpdatedEpisode');
    try {
      return super.renderUpdatedEpisode(id, newStats);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedFavorite(Anime anime, bool newValue) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.renderUpdatedFavorite');
    try {
      return super.renderUpdatedFavorite(anime, newValue);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
latests: ${latests},
loadingLatests: ${loadingLatests},
latestsError: ${latestsError},
trending: ${trending},
loadingTrending: ${loadingTrending},
trendingError: ${trendingError},
random: ${random},
loadingRandom: ${loadingRandom},
loadingMoreRandom: ${loadingMoreRandom},
randomError: ${randomError},
randomLoadingMoreError: ${randomLoadingMoreError},
favorites: ${favorites},
loadingFavorites: ${loadingFavorites},
favoritesError: ${favoritesError},
emptyFavoriteList: ${emptyFavoriteList}
    ''';
  }
}
