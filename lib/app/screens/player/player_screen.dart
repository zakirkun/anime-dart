import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/player_store.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:screen/screen.dart';

class PlayerScreen extends StatefulWidget {
  final String id;
  final String url;

  const PlayerScreen({Key key, this.id, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlayerScreenState(id: id, url: url);
  }
}

class _PlayerScreenState extends State<PlayerScreen> {
  final playerStore = getIt<PlayerStore>();
  final String id;
  final String url;

  _PlayerScreenState({@required this.id, @required this.url});

  void _disableSleep() {
    Screen.keepOn(true);
  }

  void _enableSleep() {
    Screen.keepOn(false);
  }

  @override
  void initState() {
    super.initState();

    playerStore.setEpisodeDetails(id, url);
    playerStore.setMounted(true);

    if (playerStore.episodeUrlPlaying == null) {
      throw Exception("Is extremelly needed that the episode url is != null");
    }

    playerStore.initializePlayerController();
    _disableSleep();
  }

  @override
  void dispose() {
    playerStore.setMounted(false);

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    playerStore.exitPlayer();
    _enableSleep();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(15, 15, 25, 1),
      elevation: 0,
      child: Center(
        child: Observer(
          builder: (_) {
            if (playerStore.loadingPlayer) {
              return CircularProgressIndicator();
            }

            return Chewie(
              controller: playerStore.chewieController,
            );
          },
        ),
      ),
    );
  }
}
