import 'package:anime_dart/app/constants/app_theme.dart';
import 'package:anime_dart/app/screens/home/home_screen.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(AnimeDartApplication());
}

class AnimeDartApplication extends StatelessWidget {
  final themeStore = getIt<ThemeStore>();

  AnimeDartApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: "Anime Dart",
          debugShowCheckedModeBanner: false,
          theme: AppThemeColors.data(context),
          darkTheme: AppDarkThemeColors.data(context),
          themeMode: themeStore.appTheme,
          home: HomeScreen(),
        );
      },
    );
  }
}
