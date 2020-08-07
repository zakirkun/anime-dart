import 'dart:async';

import 'package:anime_dart/app/modules/home/screens/anime_details/widgets/anime_details_List.dart';
import 'package:anime_dart/app/modules/home/screens/anime_details/widgets/anime_details_list_with_header.dart';
import 'package:anime_dart/app/modules/home/store/anime_details_store.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final String animeId;

  AnimeDetailsScreen({this.animeId});

  @override
  _AnimeDetailsScreenState createState() =>
      _AnimeDetailsScreenState(animeId: animeId);
}

class _AnimeDetailsScreenState
    extends ModularState<AnimeDetailsScreen, AnimeDetailsStore> {
  final String animeId;

  final _searchQuery = TextEditingController();
  Timer _debounce;

  _AnimeDetailsScreenState({this.animeId});

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final text = _searchQuery.text;

      if (text == controller.internalSearch) {
        return;
      }

      controller.setInternalSearch(text);
      controller.filterEpisodes();
    });
  }

  _enableSearchMode() {
    controller.showSearchField(true);
  }

  _closeSearchMode() {
    _searchQuery.clear();
    controller.closeSearchMode();
  }

  @override
  void initState() {
    super.initState();

    controller.loadDetails(animeId);

    _searchQuery.addListener(_onSearchChanged);
  }

  void dispose() {
    controller.dispose();

    _searchQuery?.removeListener(_onSearchChanged);
    _searchQuery?.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Observer(builder: (_) {
          if (controller.loading) {
            return Text("Carregando...");
          }

          if (controller.showSearch) {
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
                      controller: _searchQuery)),
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
                Expanded(child: Text(controller.details.title)),
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
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (!controller.searchMode && !controller.showSearch) {
            return AnimeDetailsListWithHeader(
                details: controller.details,
                episodes: controller.episodes.toList());
          }

          if (controller.searchMode) {
            if (controller.notFoundInternalSearch) {
              return Center(
                  child: Text(
                      "Não foi posível encontrar o episódio especificado"));
            }

            return AnimeDetailsList(
                episodes: controller.filteredEpisodes.toList());
          } else {
            return AnimeDetailsList(episodes: controller.episodes.toList());
          }
        }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).backgroundColor,
            onPressed: () {
              if (controller.loading) {
                return;
              }

              controller.toggleFavorite();
            },
            child: Observer(builder: (_) {
              Color fill = Theme.of(context).textTheme.bodyText1.color;

              if (controller.loading) {
                return Icon(OMIcons.helpOutline, color: fill.withOpacity(0.3));
              }

              if (controller.details.isFavorite) {
                return Icon(Icons.favorite, color: fill);
              }

              return Icon(OMIcons.favoriteBorder, color: fill);
            })));
  }
}
