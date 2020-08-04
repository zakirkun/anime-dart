import 'package:anime_dart/constants/strings/main.dart';
import 'package:anime_dart/constants/theme/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnimeDartApp());
}

class AnimeDartApp extends StatefulWidget with WidgetsBindingObserver {
  AnimeDartApp({Key key}) : super(key: key);

  @override
  _AnimeDartAppState createState() => _AnimeDartAppState();
}

class _AnimeDartAppState extends State<AnimeDartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: AppTheme.data(context),
        darkTheme: AppDarkTheme.data(context),
        home: Scaffold(
            appBar: AppBar(title: Text(Strings.appName)),
            body: Center(child: Text(Strings.appName))));
  }
}
