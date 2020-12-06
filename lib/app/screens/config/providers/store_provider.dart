import 'package:anime_dart/app/store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StoreProvider extends InheritedWidget {
  StoreProvider({
    Key key,
    this.child,
    this.themeStore,
  }) : super(key: key, child: child);

  final Widget child;
  final ThemeStore themeStore;

  static StoreProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StoreProvider>();
  }

  @override
  bool updateShouldNotify(StoreProvider oldWidget) => true;
}
