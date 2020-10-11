import 'package:anime_dart/app/screens/home/screens/random/widgets/list.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RandomScreen extends StatefulWidget {
  RandomScreen({Key key}) : super(key: key);

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final homeStore = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();

    homeStore.loadRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (homeStore.loadingRandom) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (homeStore.randomError != null) {
          return Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  homeStore.randomError,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
                FlatButton(
                  color: Theme.of(context).cardColor,
                  onPressed: homeStore.loadRandom,
                  child: Text("Tentar novamente"),
                )
              ],
            ),
          );
        }

        return RandomList();
      }),
    );
  }
}
