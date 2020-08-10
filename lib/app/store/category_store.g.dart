// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_CategoryStoreBase.loading'))
      .value;

  final _$resultsAtom = Atom(name: '_CategoryStoreBase.results');

  @override
  ObservableList<Anime> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableList<Anime> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$errorAtom = Atom(name: '_CategoryStoreBase.error');

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

  final _$loadResultsAsyncAction =
      AsyncAction('_CategoryStoreBase.loadResults');

  @override
  Future<void> loadResults(String category) {
    return _$loadResultsAsyncAction.run(() => super.loadResults(category));
  }

  final _$_CategoryStoreBaseActionController =
      ActionController(name: '_CategoryStoreBase');

  @override
  void dispose() {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedFavorite(Anime anime, bool newValue) {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.renderUpdatedFavorite');
    try {
      return super.renderUpdatedFavorite(anime, newValue);
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results},
error: ${error},
loading: ${loading}
    ''';
  }
}
