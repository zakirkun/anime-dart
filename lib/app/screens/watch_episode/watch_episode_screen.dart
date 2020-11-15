import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/screens/anime_details/anime_details_screen.dart';
import 'package:anime_dart/app/screens/watch_episode/widgets/recommendations.dart';
import 'package:anime_dart/app/screens/watch_episode/widgets/watch_episode_buttons.dart';
import 'package:anime_dart/app/screens/watch_episode/widgets/watch_episode_header.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/watch_episode_store.dart';
import 'package:anime_dart/app/widgets/waifu/waifu_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class WatchEpisodeScreen extends StatefulWidget {
  final String id;
  final bool back;
  final List<EpisodeDetails> allEpisodes;
  final int initialIndex;

  WatchEpisodeScreen({
    @required this.id,
    this.back = false,
    this.allEpisodes,
    this.initialIndex = 0,
  }) : assert(
          back ? allEpisodes != null && initialIndex != null : true,
        );

  @override
  _WatchEpisodeScreenState createState() => _WatchEpisodeScreenState();
}

class _WatchEpisodeScreenState extends State<WatchEpisodeScreen> {
  final _localStores = <WatchEpisodeStore>[];
  final _storesListenersKeys = <String>[];

  final _centralStore = getIt<CentralStore>();

  int _currentEpisodeIndex;

  PageController _pageController;

  bool get _hasAllEpisodes => widget.allEpisodes != null;

  WatchEpisodeStore get _localStore =>
      _localStores.isNotEmpty && _localStores.length - 1 >= _currentEpisodeIndex
          ? _localStores[_currentEpisodeIndex]
          : null;

  @override
  initState() {
    super.initState();

    _currentEpisodeIndex = widget.initialIndex;

    _pageController = PageController(
      initialPage: _hasAllEpisodes ? widget.initialIndex : 0,
    );
  }

  @override
  dispose() {
    _storesListenersKeys.forEach((storeListenerKey) {
      _centralStore.removeWatchEpisodeListener(storeListenerKey);
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('Assistir Episódio'),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _hasAllEpisodes ? widget.allEpisodes.length : 1,
        onPageChanged: (index) {
          _currentEpisodeIndex = index;
        },
        itemBuilder: (context, index) {
          final localStore = WatchEpisodeStore();
          final storeListenerKey =
              _centralStore.addWatchEpisodeListener(localStore);

          _storesListenersKeys.add(storeListenerKey);
          _localStores.add(localStore);

          localStore.setWatchEpisodeId(
            _hasAllEpisodes ? widget.allEpisodes[index].id : widget.id,
          );
          localStore.loadEpisode();

          return RefreshIndicator(
            onRefresh: localStore.loadEpisode,
            color: Theme.of(context).colorScheme.onSecondary,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Container(
              child: Observer(
                builder: (_) {
                  if (localStore.loadingWatchEpisode) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (localStore.errorMsg != null) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Ocorreu um erro ao carregar os dados deste episódio, tente novamente!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.5,
                        ),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 0,
                      ),
                      child: IntrinsicHeight(
                        child: Container(
                          child: Column(
                            children: [
                              WatchEpisodeHeader(
                                storeListenerKey: storeListenerKey,
                                onNext: nextEpisode,
                                onPrev: prevEpisode,
                              ),
                              WatchButtons(
                                storeListenerKey: storeListenerKey,
                              ),
                              Recommendations(
                                storeListenerKey: storeListenerKey,
                              ),
                              WaifuWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (widget.back) {
            return Navigator.pop(context);
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AnimeDetailsScreen(
                animeId: _localStore.episodeDetails.animeId,
              ),
            ),
          );
        },
        label: Text(
          (widget.back ? "Voltar para " : "Ver ") + "lista de episódios",
        ),
        icon: Icon(
          widget.back ? Icons.arrow_back : Icons.playlist_add_check,
        ),
      ),
    );
  }

  void nextEpisode() async {
    if (_hasAllEpisodes) {
      return await _pageController.nextPage(
        duration: Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeInOut,
      );
    }

    _localStore.loadNextEpisode();
  }

  void prevEpisode() async {
    if (_hasAllEpisodes) {
      return await _pageController.previousPage(
        duration: Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeInOut,
      );
    }

    _localStore.loadPrevEpisode();
  }
}
