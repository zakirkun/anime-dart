// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStoreBase, Store {
  Computed<bool> _$isDarkThemeComputed;

  @override
  bool get isDarkTheme =>
      (_$isDarkThemeComputed ??= Computed<bool>(() => super.isDarkTheme,
              name: '_ThemeStoreBase.isDarkTheme'))
          .value;
  Computed<bool> _$isLightThemeComputed;

  @override
  bool get isLightTheme =>
      (_$isLightThemeComputed ??= Computed<bool>(() => super.isLightTheme,
              name: '_ThemeStoreBase.isLightTheme'))
          .value;
  Computed<bool> _$isSystemThemeComputed;

  @override
  bool get isSystemTheme =>
      (_$isSystemThemeComputed ??= Computed<bool>(() => super.isSystemTheme,
              name: '_ThemeStoreBase.isSystemTheme'))
          .value;

  final _$appThemeAtom = Atom(name: '_ThemeStoreBase.appTheme');

  @override
  ThemeMode get appTheme {
    _$appThemeAtom.reportRead();
    return super.appTheme;
  }

  @override
  set appTheme(ThemeMode value) {
    _$appThemeAtom.reportWrite(value, super.appTheme, () {
      super.appTheme = value;
    });
  }

  final _$_ThemeStoreBaseActionController =
      ActionController(name: '_ThemeStoreBase');

  @override
  void setAppTheme(ThemeMode newTheme) {
    final _$actionInfo = _$_ThemeStoreBaseActionController.startAction(
        name: '_ThemeStoreBase.setAppTheme');
    try {
      return super.setAppTheme(newTheme);
    } finally {
      _$_ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appTheme: ${appTheme},
isDarkTheme: ${isDarkTheme},
isLightTheme: ${isLightTheme},
isSystemTheme: ${isSystemTheme}
    ''';
  }
}
