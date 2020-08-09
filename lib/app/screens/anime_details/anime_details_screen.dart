import 'dart:async';

import 'package:anime_dart/app/screens/anime_details/widgets/anime_details_list.dart';
import 'package:anime_dart/app/screens/anime_details/widgets/anime_details_list_with_header.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/anime_details_store.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final String animeId;
  AnimeDetailsScreen({this.animeId});

  @override
  _AnimeDetailsScreenState createState() =>
      _AnimeDetailsScreenState(animeId: animeId);
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  String animeId;
  String storeListenerKey;
  AnimeDetailsStore localStore = AnimeDetailsStore();
  final centralStore = getIt<CentralStore>();

  final searchQuery = TextEditingController();
  Timer debounce;

  _AnimeDetailsScreenState({@required this.animeId}) {
    storeListenerKey = centralStore.addAnimeDetailsListener(localStore);
  }

  _onSearchChanged() {
    if (debounce?.isActive ?? false) {
      debounce.cancel();
    }

    debounce = Timer(Duration(milliseconds: 500), () {
      final text = searchQuery.text;

      if (text == localStore.internalSearch) {
        return;
      }

      localStore.setInternalSearch(text);
      localStore.filterEpisodes();
    });
  }

  _enableSearchMode() {
    localStore.showSearchField(true);
  }

  _closeSearchMode() {
    searchQuery.clear();
    localStore.closeSearchMode();
  }

  @override
  void initState() {
    super.initState();

    localStore.setAnimeDetailsId(animeId);
    localStore.loadAnimeDetails();

    searchQuery.addListener(_onSearchChanged);
  }

  void dispose() {
    centralStore.removeAnimeDetailsListener(storeListenerKey);
    searchQuery?.removeListener(_onSearchChanged);
    searchQuery?.dispose();
    debounce?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Observer(builder: (_) {
          if (localStore.loading) {
            return Text("Carregando...");
          }

          if (localStore.error != null) {
            return Text("Oooops...");
          }

          if (localStore.showSearch) {
            return Row(children: [
              Expanded(
                  child: TextField(
                      autofocus: true,
                      style: TextStyle(
                          color: Theme.of(context).primaryIconTheme.color),
                      cursorColor: Theme.of(context).primaryIconTheme.color,
                      decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .primaryIconTheme
                                  .color
                                  .withOpacity(0.5)),
                          hintText: 'Digite o número do episódio'),
                      controller: searchQuery)),
              GestureDetector(
                  onTap: _closeSearchMode,
                  child: Container(
                      height: 40,
                      width: 50,
                      child: Icon(Icons.close),
                      alignment: Alignment.centerRight))
            ]);
          }

          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(localStore.animeDetails.title)),
                GestureDetector(
                    onTap: _enableSearchMode,
                    child: Container(
                        height: 40,
                        width: 50,
                        child: Icon(Icons.search),
                        alignment: Alignment.centerRight))
              ]);
        })),
        body: Observer(builder: (_) {
          if (localStore.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (localStore.error != null) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              child: Text(
                  "Ocorreu um erro ao carregar os episódios deste anime, tente novamente!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                  )),
            );
          }

          if (!localStore.searchMode && !localStore.showSearch) {
            return AnimeDetailsListWithHeader(
                storeListenerKey: storeListenerKey);
          }

          if (localStore.searchMode) {
            if (localStore.notFoundInternalSearch) {
              return Center(
                  child: Text(
                      "Não foi posível encontrar o episódio especificado"));
            }

            return AnimeDetailsList(storeListenerKey: storeListenerKey);
          } else {
            return AnimeDetailsList(storeListenerKey: storeListenerKey);
          }
        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).cardColor,
            onPressed: () {
              if (localStore.loading || localStore.error != null) {
                return;
              }

              centralStore.setEpisodeFavorite(
                  localStore.animeId, !localStore.animeDetails.isFavorite);
            },
            child: Observer(builder: (_) {
              Color fill = Theme.of(context).textTheme.bodyText1.color;

              if (localStore.loading || localStore.error != null) {
                return Icon(OMIcons.helpOutline, color: fill.withOpacity(0.3));
              }

              if (localStore.animeDetails.isFavorite) {
                return Icon(Icons.favorite, color: fill);
              }

              return Icon(OMIcons.favoriteBorder, color: fill);
            })));
  }
}
