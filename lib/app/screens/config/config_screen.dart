import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/theme_store.dart';
import 'package:anime_dart/app/widgets/waifu/waifu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ConfigScreen extends StatefulWidget {
  ConfigScreen({Key key}) : super(key: key);

  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final themeStore = getIt<ThemeStore>();

  bool get isDarkTheme => themeStore.isDarkTheme;
  bool get isLightTheme => themeStore.isLightTheme;
  bool get isSystemTheme => themeStore.isSystemTheme;

  @override
  Widget build(BuildContext context) {
    print(themeStore.appTheme);
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Tema do aplicativo',
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.5),
                ),
              ),
            ),
            Observer(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    border: _buildBorder(
                      active: isLightTheme,
                      dark: false,
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Icon(Icons.brightness_low),
                    title: _buildListTileStack(
                      children: [
                        Text('Light Theme'),
                        if (isLightTheme) _buildCurrentLabel(),
                      ],
                    ),
                    onTap: () => setTheme(ThemeMode.light),
                  ),
                );
              },
            ),
            Observer(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    border: _buildBorder(
                      active: isDarkTheme,
                      dark: true,
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Icon(Icons.brightness_3),
                    title: _buildListTileStack(
                      children: [
                        Text('Dark Theme'),
                        if (isDarkTheme) _buildCurrentLabel(),
                      ],
                    ),
                    onTap: () => setTheme(ThemeMode.dark),
                  ),
                );
              },
            ),
            Observer(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    border: _buildBorder(
                      active: isSystemTheme,
                      dark: false,
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: Icon(OMIcons.smartphone),
                    title: _buildListTileStack(
                      children: [
                        Text('System Theme'),
                        if (isSystemTheme) _buildCurrentLabel(),
                      ],
                    ),
                    onTap: () => setTheme(ThemeMode.system),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            WaifuWidget(),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: _buildBorder(
                  active: true,
                  dark: isDarkTheme,
                ),
                color: Theme.of(context).cardColor,
              ),
              child: Text(
                'Em construção...',
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.3),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Border _buildBorder({bool dark = true, bool active = false}) {
    return Border(
      left: BorderSide(
        color: active
            ? dark
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary
            : Colors.transparent,
        width: 3,
      ),
    );
  }

  Widget _buildListTileStack({List<Widget> children}) {
    return Stack(
      alignment: Alignment.centerLeft,
      overflow: Overflow.visible,
      children: children,
    );
  }

  Widget _buildCurrentLabel() {
    return Positioned(
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: isDarkTheme
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Text(
          'Current',
          style: TextStyle(
            fontSize: 10,
            color: isDarkTheme
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }

  void setTheme(ThemeMode newTheme) {
    if (newTheme == themeStore.appTheme) {
      return;
    }

    themeStore.setAppTheme(newTheme);
  }
}
