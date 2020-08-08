import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/player_store.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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

  @override
  void initState() {
    super.initState();

    playerStore.setEpisodeDetails(id, url);

    if (playerStore.episodeUrlPlaying == null) {
      throw Exception("Is extremelly needed that the episode url is != null");
    }

    playerStore.initializePlayerController();
  }

  @override
  void dispose() {
    playerStore.exitPlayer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(15, 15, 25, 1),
      elevation: 0,
      child: Center(child: Observer(builder: (_) {
        if (!playerStore.playerOk) {
          return CircularProgressIndicator();
        }

        return Chewie(
          controller: playerStore.chewieController,
        );
      })),
    );
  }
}
