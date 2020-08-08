import 'package:anime_dart/app/screens/watch_episode/widgets/watch_episode_buttons.dart';
import 'package:anime_dart/app/screens/watch_episode/widgets/watch_episode_header.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/watch_episode_store.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class WatchEpisodeScreen extends StatefulWidget {
  final String id;
  WatchEpisodeScreen({this.id});

  @override
  _WatchEpisodeScreenState createState() => _WatchEpisodeScreenState(id: id);
}

class _WatchEpisodeScreenState extends State<WatchEpisodeScreen> {
  final localStore = WatchEpisodeStore();
  final centralStore = getIt<CentralStore>();
  String storeListenerKey;
  final String id;

  _WatchEpisodeScreenState({@required this.id});

  @override
  initState() {
    super.initState();

    storeListenerKey = centralStore.addWatchEpisodeListener(localStore);
    localStore.setWatchEpisodeId(id);

    localStore.loadEpisode();
  }

  @override
  dispose() {
    centralStore.removeWatchEpisodeListener(storeListenerKey);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Container(child: Observer(builder: (_) {
          if (localStore.loadingWatchEpisode) {
            return Text("Carregando...");
          }

          if (localStore.errorMsg != null) {
            return Text("Ops, algo deu errado");
          }

          return Text(localStore.episodeDetails.label);
        }))),
        body: Container(child: Observer(
          builder: (_) {
            if (localStore.loadingWatchEpisode) {
              return Center(child: CircularProgressIndicator());
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
                    )),
              );
            }

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 0,
                ),
                child: IntrinsicHeight(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Column(children: [
                        WatchEpisodeHeader(
                          storeListenerKey: storeListenerKey,
                        ),
                        WatchButtons(
                          storeListenerKey: storeListenerKey,
                        )
                      ])),
                ),
              ),
            );
          },
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (localStore.loadingWatchEpisode) {
              return;
            }
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (_) => AnimeDetailsScreen(id: localStore.episodeDetails.animeId);
            // ));
          },
          label: Text('Ver lista de episódios'),
          icon: Icon(Icons.playlist_add_check),
        ));
  }
}
