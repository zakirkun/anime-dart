import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel(this.label, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.5),
        ),
      ),
    );
  }
}
