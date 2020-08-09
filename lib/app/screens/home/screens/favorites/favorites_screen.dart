import 'package:anime_dart/app/screens/home/screens/favorites/widgets/list.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final homeStore = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();

    homeStore.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        if (homeStore.loadingFavorites) {
          return Center(child: CircularProgressIndicator());
        }
        if (homeStore.favoritesError != null) {
          return Center(
              child: Column(
            children: [
              Text(homeStore.favoritesError),
              FlatButton(
                  onPressed: homeStore.loadFavorites,
                  child: Text("Tentar novamente"))
            ],
          ));
        }

        if (homeStore.emptyFavoriteList) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Text(
                "Sua lista de favoritos está vazia! Adicione um clicando no botão na parte inferior direita da tela!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                )),
          );
        }

        return FavoritesList();
      }),
    );
  }
}
