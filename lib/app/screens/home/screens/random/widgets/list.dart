import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/screens/anime_details/anime_details_screen.dart';
import 'package:anime_dart/app/screens/home/screens/random/widgets/tile.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RandomList extends StatefulWidget {
  RandomList({Key key}) : super(key: key);

  @override
  _RandomListState createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  ScrollController scrollController;
  final homeStore = getIt<HomeStore>();
  final centralStore = getIt<CentralStore>();

  void onListScroll() {
    if (homeStore.loadingMoreRandom) {
      return;
    }

    if (scrollController.offset >=
            (scrollController.position.maxScrollExtent - 600) &&
        !scrollController.position.outOfRange) {
      homeStore.loadMoreRandom();
    }
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(onListScroll);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.onSecondary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onRefresh: homeStore.loadRandom,
      child: Observer(
        builder: (_) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              separatorBuilder: (_, __) => Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              itemCount: homeStore.random.length,
              itemBuilder: (BuildContext context, int index) {
                final anime = homeStore.random[index];

                void onTap() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AnimeDetailsScreen(
                        animeId: anime.id,
                      ),
                    ),
                  );
                }

                void onTapFavorite() {
                  centralStore.setEpisodeFavorite(
                      Anime(
                          id: anime.id,
                          imageHttpHeaders: anime.imageHttpHeaders,
                          imageUrl: anime.imageUrl,
                          isFavorite: anime.isFavorite,
                          title: anime.title),
                      !anime.isFavorite);
                }

                return RandomTile(
                    anime: anime,
                    cardLabel: "ALEATÓRIO",
                    onTap: onTap,
                    onTapFavorite: onTapFavorite);
              });
        },
      ),
    );
  }
}
