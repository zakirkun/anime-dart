import 'package:anime_dart/app/screens/anime_details/widgets/anime_details_tile.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/anime_details_store.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AnimeDetailsList extends StatefulWidget {
  final String storeListenerKey;

  AnimeDetailsList({Key key, this.storeListenerKey}) : super(key: key);

  @override
  _AnimeDetailsListState createState() =>
      _AnimeDetailsListState(storeListenerKey: storeListenerKey);
}

class _AnimeDetailsListState extends State<AnimeDetailsList> {
  final String storeListenerKey;
  AnimeDetailsStore localStore;
  final centralStore = getIt<CentralStore>();

  _AnimeDetailsListState({Key key, @required this.storeListenerKey});

  @override
  void initState() {
    super.initState();

    localStore = centralStore.getAnimeDetailsListener(storeListenerKey);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Observer(builder: (_) {
      return ListView.separated(
          padding: EdgeInsets.only(bottom: 85),
          itemBuilder: (_, i) {
            final episode = (localStore.searchMode
                ? localStore.filteredEpisodes
                : localStore.episodesOfAnimeDetails)[i];

            return AnimeDetailsTile(episode: episode);
          },
          separatorBuilder: (_, __) =>
              Divider(color: Colors.transparent, height: 10),
          itemCount: localStore.searchMode
              ? localStore.filteredEpisodes.length
              : localStore.episodesOfAnimeDetails.length);
    }));
  }
}
