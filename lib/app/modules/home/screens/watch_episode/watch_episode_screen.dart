import 'package:anime_dart/app/modules/home/screens/watch_episode/widgets/watch_episode_buttons.dart';
import 'package:anime_dart/app/modules/home/screens/watch_episode/widgets/watch_episode_header.dart';
import 'package:anime_dart/app/modules/home/store/watch_episode_store.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WatchEpisodeScreen extends StatefulWidget {
  final String episodeId;

  WatchEpisodeScreen({this.episodeId});

  @override
  _WatchEpisodeScreenState createState() =>
      _WatchEpisodeScreenState(episodeId: episodeId);
}

class _WatchEpisodeScreenState
    extends ModularState<WatchEpisodeScreen, WatchEpisodeStore> {
  final String episodeId;

  _WatchEpisodeScreenState({this.episodeId});

  @override
  initState() {
    super.initState();

    controller.loadEpisode(episodeId);
  }

  @override
  dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Container(child: Observer(builder: (_) {
          if (controller.loading) {
            return Text("Carregando...");
          }

          if (controller.errorMsg != null) {
            return Text("Ops, algo deu errado");
          }

          return Text(controller.episodeDetails.label);
        }))),
        body: Container(child: Observer(
          builder: (_) {
            if (controller.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.errorMsg != null) {
              return Center(child: Text(controller.errorMsg));
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
                          episodeDetails: controller.episodeDetails,
                        ),
                        WatchButtons(
                          videoUrlHd: controller.episodeDetails.urlHd,
                          videoUrl: controller.episodeDetails.url,
                        )
                      ])),
                ),
              ),
            );
          },
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Ver lista de episódios'),
          icon: Icon(Icons.playlist_add_check),
        ));
  }
}
