import 'package:anime_dart/app/constants/app_theme.dart';
import 'package:anime_dart/app/screens/home/home_screen.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:flutter/material.dart';

void main() {
  setup();

  runApp(AnimeDartApplication());
}

class AnimeDartApplication extends StatefulWidget {
  AnimeDartApplication({Key key}) : super(key: key);

  @override
  _AnimeDartApplicationState createState() => _AnimeDartApplicationState();
}

class _AnimeDartApplicationState extends State<AnimeDartApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anime Dart",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data(context),
      darkTheme: AppDarkTheme.data(context),
      home: HomeScreen(),
    );
  }
}
