import 'package:anime_dart/app/screens/home/screens/latests/widgets/tile.dart';
import 'package:anime_dart/app/screens/watch_episode/watch_episode_screen.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LatestsList extends StatefulWidget {
  LatestsList({Key key}) : super(key: key);

  @override
  _LatestsListState createState() => _LatestsListState();
}

class _LatestsListState extends State<LatestsList> {
  final homeStore = getIt<HomeStore>();
  final centralStore = getIt<CentralStore>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onRefresh: homeStore.loadLatests,
        child: Observer(builder: (_) {
          return ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(color: Colors.transparent, height: 10),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              itemCount: homeStore.latests.length,
              itemBuilder: (BuildContext context, int index) {
                final episode = homeStore.latests[index];

                void onTap() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => WatchEpisodeScreen(id: episode.id)));
                }

                void onTapBpokMark() {
                  centralStore.setEpisodeStats(
                      episode.id, episode.stats < 10 ? 100 : 0);
                }

                return LatestsTile(
                    onTapBookMark: onTapBpokMark,
                    episode: episode,
                    cardLabel: "LANÇAMENTOS",
                    onTap: onTap);
              });
        }));
  }
}
