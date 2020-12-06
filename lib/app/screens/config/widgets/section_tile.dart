import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final bool showBorder;
  final BoxDecoration decoration;
  final Widget leading;
  final Widget title;
  final VoidCallback onTap;

  const SectionTile({
    Key key,
    this.showBorder,
    this.decoration = const BoxDecoration(),
    this.leading,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration.copyWith(
        color: Theme.of(context).cardColor,
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: leading,
        title: title,
        onTap: onTap,
      ),
    );
  }
}
