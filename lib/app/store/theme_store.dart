import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  static final themeBoxKey = 'theme__key__box';
  static final themeDataKey = 'current__theme';

  _ThemeStoreBase() {
    ThemeMode currentTheme;

    if (hiveBox.containsKey(themeDataKey)) {
      currentTheme = _stringToThemeMode(hiveBox.get(themeDataKey));
    }

    appTheme = currentTheme;
  }

  final hiveBox = Hive.box(themeBoxKey);

  @observable
  ThemeMode appTheme;

  @computed
  bool get isDarkTheme => appTheme == ThemeMode.dark;

  @computed
  bool get isLightTheme => appTheme == ThemeMode.light;

  @computed
  bool get isSystemTheme => appTheme == ThemeMode.system;

  @action
  void setAppTheme(ThemeMode newTheme) {
    appTheme = newTheme;

    hiveBox.put(themeDataKey, _themeModeToString(appTheme));
  }

  ThemeMode _stringToThemeMode(String target) {
    final map = <String, ThemeMode>{
      'system': ThemeMode.system,
      'light': ThemeMode.light,
      'dark': ThemeMode.dark,
    };

    return map[target];
  }

  String _themeModeToString(ThemeMode target) {
    final map = <ThemeMode, String>{
      ThemeMode.system: 'system',
      ThemeMode.light: 'light',
      ThemeMode.dark: 'dark',
    };

    return map[target];
  }
}
