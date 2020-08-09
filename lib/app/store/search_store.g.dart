// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStoreBase, Store {
  Computed<bool> _$waitingTypeComputed;

  @override
  bool get waitingType =>
      (_$waitingTypeComputed ??= Computed<bool>(() => super.waitingType,
              name: '_SearchStoreBase.waitingType'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_SearchStoreBase.loading'))
      .value;

  final _$textAtom = Atom(name: '_SearchStoreBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$resultsAtom = Atom(name: '_SearchStoreBase.results');

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

  final _$notFoundAtom = Atom(name: '_SearchStoreBase.notFound');

  @override
  bool get notFound {
    _$notFoundAtom.reportRead();
    return super.notFound;
  }

  @override
  set notFound(bool value) {
    _$notFoundAtom.reportWrite(value, super.notFound, () {
      super.notFound = value;
    });
  }

  final _$errorAtom = Atom(name: '_SearchStoreBase.error');

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

  final _$loadResultsAsyncAction = AsyncAction('_SearchStoreBase.loadResults');

  @override
  Future<void> loadResults() {
    return _$loadResultsAsyncAction.run(() => super.loadResults());
  }

  final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase');

  @override
  dynamic setText(dynamic value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renderUpdatedFavorite(String id, bool newValue) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.renderUpdatedFavorite');
    try {
      return super.renderUpdatedFavorite(id, newValue);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
results: ${results},
notFound: ${notFound},
error: ${error},
waitingType: ${waitingType},
loading: ${loading}
    ''';
  }
}
