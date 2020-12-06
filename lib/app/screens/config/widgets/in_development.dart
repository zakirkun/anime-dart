import 'package:anime_dart/app/screens/config/providers/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:anime_dart/app/widgets/waifu/waifu_widget.dart';

class InDevelopment extends StatelessWidget {
  const InDevelopment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = StoreProvider.of(context).themeStore.isDarkTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WaifuWidget(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: _buildBorder(
              context,
              active: true,
              dark: isDarkTheme,
            ),
            color: Theme.of(context).cardColor,
          ),
          child: Text(
            'Em construção...',
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(.3),
            ),
          ),
        ),
      ],
    );
  }

  Border _buildBorder(
    BuildContext context, {
    bool dark = true,
    bool active = false,
  }) {
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
}
