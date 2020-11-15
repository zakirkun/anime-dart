import 'package:anime_dart/app/screens/about/about_screen.dart';
import 'package:anime_dart/app/screens/home/screens/category/category_screen.dart';
import 'package:anime_dart/app/screens/home/screens/favorites/favorites_screen.dart';
import 'package:anime_dart/app/screens/home/screens/latests/latest_screen.dart';
import 'package:anime_dart/app/screens/home/screens/random/random_screen.dart';
import 'package:flutter/material.dart';

class MainTabs {
  static final tabs = [
    TabData(builder: (_) => LatestsScreen(), label: "LANÇAMENTOS"),
    TabData(builder: (_) => FavoritesScreen(), label: "FAVORITOS"),
    TabData(builder: (_) => RandomScreen(), label: "RANDOM"),
    TabData(builder: (_) => CategoryScreen(), label: "CATEGORIAS"),
    TabData(builder: (_) => AboutScreen(), label: "CRÉDITOS"),
  ];
}

class TabData {
  final Widget Function(BuildContext) builder;
  final String label;

  TabData({@required this.label, @required this.builder});
}
