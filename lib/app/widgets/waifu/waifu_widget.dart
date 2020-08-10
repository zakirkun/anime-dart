import 'package:flutter/material.dart';

class WaifuWidget extends StatelessWidget {
  const WaifuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.1,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/waifu.png",
            height: 200,
          ),
        ));
  }
}
