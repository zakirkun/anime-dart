import 'package:anime_dart/app/modules/home/screens/favorites/favorites_screen.dart';
import 'package:anime_dart/app/modules/home/screens/latest/latests_screen.dart';
import 'package:anime_dart/app/modules/home/screens/random/random_screen.dart';
import 'package:anime_dart/app/modules/home/screens/trending/trending_screen.dart';
import 'package:flutter/material.dart';

class MainTabs {
  static final tabs = [
    TabData(builder: (_) => LatestsScreen(), label: "LANÇAMENTOS"),
    TabData(builder: (_) => RandomScreen(), label: "RANDOM"),
    TabData(builder: (_) => FavoritesScreen(), label: "FAVORITOS"),
    TabData(builder: (_) => TrendingScreen(), label: "POPULARES"),
  ];
}

class TabData {
  final Widget Function(BuildContext) builder;
  final String label;

  TabData({@required this.label, @required this.builder});
}
