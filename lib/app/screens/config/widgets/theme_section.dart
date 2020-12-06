import 'package:anime_dart/app/screens/config/providers/store_provider.dart';
import 'package:anime_dart/app/screens/config/widgets/section_label.dart';
import 'package:anime_dart/app/screens/config/widgets/section_tile.dart';
import 'package:anime_dart/app/store/theme_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThemeSection extends StatefulWidget {
  ThemeSection({Key key}) : super(key: key);

  @override
  _ThemeSectionState createState() => _ThemeSectionState();
}

class _ThemeSectionState extends State<ThemeSection> {
  bool get _isDarkTheme => _themeStore.isDarkTheme;
  bool get _isLightTheme => _themeStore.isLightTheme;
  bool get _isSystemTheme => _themeStore.isSystemTheme;

  ThemeStore get _themeStore => StoreProvider.of(context).themeStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel('Tema do aplicativo'),
        Observer(
          builder: (context) {
            return SectionTile(
              decoration: BoxDecoration(
                border: _buildBorder(
                  active: _isLightTheme,
                  dark: false,
                ),
              ),
              leading: Icon(Icons.brightness_low),
              title: _buildListTileStack(
                children: [
                  Text('Light Theme'),
                  if (_isLightTheme) _buildCurrentLabel(),
                ],
              ),
              onTap: () => _setTheme(ThemeMode.light),
            );
          },
        ),
        Observer(
          builder: (context) {
            return SectionTile(
              decoration: BoxDecoration(
                border: _buildBorder(
                  active: _isDarkTheme,
                  dark: true,
                ),
                color: Theme.of(context).cardColor,
              ),
              leading: Icon(Icons.brightness_3),
              title: _buildListTileStack(
                children: [
                  Text('Dark Theme'),
                  if (_isDarkTheme) _buildCurrentLabel(),
                ],
              ),
              onTap: () => _setTheme(ThemeMode.dark),
            );
          },
        ),
        Observer(
          builder: (context) {
            return SectionTile(
              decoration: BoxDecoration(
                border: _buildBorder(
                  active: _isSystemTheme,
                  dark: false,
                ),
                color: Theme.of(context).cardColor,
              ),
              leading: Icon(Icons.smartphone),
              title: _buildListTileStack(
                children: [
                  Text('System Theme'),
                  if (_isSystemTheme) _buildCurrentLabel(),
                ],
              ),
              onTap: () => _setTheme(ThemeMode.system),
            );
          },
        ),
      ],
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
          color: _isDarkTheme
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Text(
          'Current',
          style: TextStyle(
            fontSize: 10,
            color: _isDarkTheme
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.onSecondary,
          ),
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

  void _setTheme(ThemeMode newTheme) {
    if (newTheme == _themeStore.appTheme) {
      return;
    }

    _themeStore.setAppTheme(newTheme);
  }
}
