import 'package:anime_dart/app/screens/anime_details/anime_details_screen.dart';
import 'package:anime_dart/app/screens/search/widgets/search_tile.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/search_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchList extends StatefulWidget {
  final String storeListenerKey;
  SearchList({Key key, this.storeListenerKey}) : super(key: key);

  @override
  _SearchListState createState() =>
      _SearchListState(storeListenerKey: storeListenerKey);
}

class _SearchListState extends State<SearchList> {
  String storeListenerKey;
  SearchStore localStore;
  final centralStore = getIt<CentralStore>();

  _SearchListState({@required this.storeListenerKey}) {
    localStore = centralStore.getSearchListener(storeListenerKey);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onRefresh: localStore.loadResults,
        child: Observer(builder: (_) {
          return ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(color: Colors.transparent, height: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              itemCount: localStore.results.length,
              itemBuilder: (BuildContext context, int index) {
                final anime = localStore.results[index];

                void onTap() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              AnimeDetailsScreen(animeId: anime.id)));
                }

                void onTapFavorite() {
                  centralStore.setEpisodeFavorite(anime.id, !anime.isFavorite);
                }

                return SearchTile(
                    anime: anime,
                    cardLabel: "RESULTADOS",
                    onTap: onTap,
                    onTapFavorite: onTapFavorite);
              });
        }));
  }
}
