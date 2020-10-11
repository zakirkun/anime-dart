import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/screens/player/player_screen.dart';
import 'package:anime_dart/app/screens/watch_episode/widgets/ripple_button.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/watch_episode_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WatchButtons extends StatefulWidget {
  final String storeListenerKey;
  WatchButtons({Key key, this.storeListenerKey}) : super(key: key);

  @override
  _WatchButtonsState createState() =>
      _WatchButtonsState(storeListenerKey: storeListenerKey);
}

class _WatchButtonsState extends State<WatchButtons> {
  final storeListenerKey;
  final centralStore = getIt<CentralStore>();
  WatchEpisodeStore localStore;

  _WatchButtonsState({this.storeListenerKey});

  @override
  void initState() {
    super.initState();

    if (storeListenerKey == null) {
      throw Exception("Store key must be != null");
    }
    localStore = centralStore.getWatchEpisodeListener(storeListenerKey);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (localStore.loadingWatchEpisode ||
              localStore.loadingOtherEpisode) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Theme.of(context).cardColor,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Assistir Online:",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(0.5),
                        ),
                      ),
                    ),
                    localStore.episodeDetails?.urlHd == null ||
                            (localStore.episodeDetails?.urlHd?.isEmpty ?? false)
                        ? (RippleButton(
                            color: Colors.white.withOpacity(0.01),
                            onTap: () {},
                            label: "Esse episódio não está disponível em HD",
                          ))
                        : (RippleButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onTap: () {
                              if (localStore.episodeDetails?.urlHd == null ||
                                  (localStore.episodeDetails?.urlHd?.isEmpty ??
                                      false)) {
                                return;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PlayerScreen(
                                    id: localStore.episodeDetails.id,
                                    url: localStore.episodeDetails.urlHd,
                                  ),
                                ),
                              );
                            },
                            label: "Assistir em HD")),
                    RippleButton(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      onTap: () {
                        if (localStore.episodeDetails?.url == null) {
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PlayerScreen(
                              id: localStore.episodeDetails.id,
                              url: localStore.episodeDetails.url,
                            ),
                          ),
                        );
                      },
                      label: "Assistir",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Theme.of(context).cardColor,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fazer Download:",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(0.5),
                        ),
                      ),
                    ),
                    localStore.episodeDetails?.urlHd == null ||
                            (localStore.episodeDetails?.urlHd?.isEmpty ?? false)
                        ? (RippleButton(
                            color: Colors.white.withOpacity(0.01),
                            onTap: () {},
                            label: "Esse episódio não está disponível em HD"))
                        : (RippleButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onTap: () {
                              if (localStore.episodeDetails?.urlHd == null ||
                                  (localStore.episodeDetails?.urlHd?.isEmpty ??
                                      false)) {
                                return;
                              }
                              Utils.openUrl(localStore.episodeDetails?.urlHd);
                            },
                            label: "Download em HD")),
                    RippleButton(
                        color: Theme.of(context).colorScheme.secondaryVariant,
                        onTap: () async {
                          if (localStore.episodeDetails?.url == null) {
                            return;
                          }

                          try {
                            await Utils.openUrl(localStore.episodeDetails?.url);
                          } catch (e) {
                            print(e);
                          }
                        },
                        label: "Download"),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
