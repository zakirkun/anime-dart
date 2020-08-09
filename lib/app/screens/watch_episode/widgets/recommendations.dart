import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/screens/anime_details/anime_details_screen.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/watch_episode_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Recommendations extends StatefulWidget {
  final String storeListenerKey;
  Recommendations({Key key, this.storeListenerKey}) : super(key: key);

  @override
  _RecommendationsState createState() =>
      _RecommendationsState(storeListenerKey: storeListenerKey);
}

class _RecommendationsState extends State<Recommendations> {
  final String storeListenerKey;
  final centralStore = getIt<CentralStore>();
  WatchEpisodeStore localStore;
  ScrollController recommendationController;

  _RecommendationsState({@required this.storeListenerKey}) {
    if (storeListenerKey == null) {
      throw Exception("Recommendation components: missing storeListenerKey");
    }

    localStore = centralStore.getWatchEpisodeListener(storeListenerKey);
  }

  void scrollRecommendationsListener() {
    if (localStore.loadingMoreRecommendations) {
      return;
    }

    if (recommendationController.offset >=
            (recommendationController.position.maxScrollExtent - 300) &&
        !recommendationController.position.outOfRange) {
      localStore.loadMoreRecommendations();
    }
  }

  @override
  void initState() {
    localStore.loadRecommendations();

    recommendationController = ScrollController();
    recommendationController.addListener(scrollRecommendationsListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = 120;
    double imageHeight = 185.50;

    return Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          Container(
              child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Text("Você pode gostar...")),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text(
                    "Clique para favoritar ou pressione para ver detalhes",
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.3))))
          ])),
          Observer(builder: (_) {
            if (localStore.loadingRecommendations) {
              return Container(
                  height: imageHeight,
                  width: imageWidth,
                  child: Center(child: CircularProgressIndicator()));
            }

            if (localStore.recommendationsError != null) {
              return Text(localStore.recommendationsError);
            }

            return Container(
              height: imageHeight,
              child: ListView.separated(
                controller: recommendationController,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: localStore.recommendations.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 10, color: Colors.transparent),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  final anime = localStore.recommendations[i];

                  return recommendationCard(anime);
                },
              ),
            );
          })
        ]));
  }

  Widget recommendationCard(Anime anime) {
    double imageWidth = 120;
    double imageHeight = 185.50;

    void onTap() {
      centralStore.setEpisodeFavorite(anime, !anime.isFavorite);
    }

    void onLongPress() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AnimeDetailsScreen(animeId: anime.id)));
    }

    return GestureDetector(
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Stack(children: [
              Container(
                  width: imageWidth,
                  child: Column(children: [
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                                width: imageWidth,
                                height: imageHeight,
                                fit: BoxFit.cover,
                                httpHeaders: anime.imageHttpHeaders,
                                imageUrl: anime.imageUrl,
                                placeholder: (context, url) => Container(
                                    width: imageWidth,
                                    height: imageHeight,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(.10)),
                                errorWidget: (context, url, error) => Container(
                                    width: imageWidth,
                                    height: imageHeight,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(.10)
                                        .withOpacity(.60))))),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        anime.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ])),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                      child: Icon(Icons.favorite,
                          color: anime.isFavorite ? Colors.red : Colors.white)))
            ])));
  }
}
