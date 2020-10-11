import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/anime_details_store.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeDetailsHeader extends StatefulWidget {
  final String storeListenerKey;
  AnimeDetailsHeader({Key key, this.storeListenerKey}) : super(key: key);

  @override
  _AnimeDetailsHeaderState createState() =>
      _AnimeDetailsHeaderState(storeListenerKey: storeListenerKey);
}

class _AnimeDetailsHeaderState extends State<AnimeDetailsHeader> {
  final String storeListenerKey;
  final centralStore = getIt<CentralStore>();
  AnimeDetailsStore localStore;

  _AnimeDetailsHeaderState({@required this.storeListenerKey});

  @override
  void initState() {
    super.initState();

    localStore = centralStore.getAnimeDetailsListener(storeListenerKey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                width: 140,
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        httpHeaders: localStore.animeDetails.imageHttpHeaders,
                        imageUrl: localStore.animeDetails.imageUrl,
                        placeholder: (context, url) => Container(
                            width: 140,
                            height: 200,
                            color: Colors.purple.withOpacity(.10)),
                        errorWidget: (context, url, error) => Container(
                            width: 140,
                            height: 200,
                            color: Colors.black.withOpacity(.60))))),
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 30, left: 10, right: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(localStore.animeDetails.year,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.05),
                                    border: Border(
                                        left: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            style: BorderStyle.solid,
                                            width: 2))),
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 20, left: 10, right: 10),
                                child: Text(localStore.animeDetails.title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .fontSize)))
                          ])),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Wrap(children: [
                        for (final genre in localStore.animeDetails.genres)
                          Container(
                              margin: EdgeInsets.only(right: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.all(5),
                              child: Text(genre,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)))
                      ])),
                ]))
          ]),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(localStore.animeDetails.synopsis,
                  style: TextStyle(height: 2))),
        ]));
  }
}
