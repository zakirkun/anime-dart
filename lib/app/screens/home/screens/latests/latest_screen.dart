import 'package:anime_dart/app/screens/home/screens/latests/widgets/list.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LatestsScreen extends StatefulWidget {
  LatestsScreen({Key key}) : super(key: key);

  @override
  _LatestsScreenState createState() => _LatestsScreenState();
}

class _LatestsScreenState extends State<LatestsScreen> {
  final homeStore = getIt<HomeStore>();
  final centralStore = getIt<CentralStore>();

  @override
  void initState() {
    super.initState();

    homeStore.loadLatests();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (homeStore.loadingLatests) {
          return Center(child: CircularProgressIndicator());
        }
        if (homeStore.latestsError != null) {
          return Center(
              child: Column(
            children: [
              Text(homeStore.latestsError),
              FlatButton(
                  onPressed: homeStore.loadLatests,
                  child: Text("Tentar novamente"))
            ],
          ));
        }

        return LatestsList();
      }),
    );
  }
}
