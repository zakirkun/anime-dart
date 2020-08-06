// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
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

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic dispose() {
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
trendingError: ${trendingError}
    ''';
  }
}
