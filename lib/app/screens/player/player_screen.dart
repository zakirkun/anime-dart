import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/player_store.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PlayerScreen extends StatefulWidget {
  final String id;
  final String url;

  const PlayerScreen({Key key, this.id, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlayerScreenState();
  }
}

class _PlayerScreenState extends State<PlayerScreen> {
  final playerStore = getIt<PlayerStore>();
  _PlayerScreenState();

  @override
  void initState() {
    super.initState();

    playerStore.setEpisodeDetails(widget.id, widget.url);

    if (playerStore.episodeUrlPlaying == null) {
      throw Exception("Is extremelly needed that the episode url is != null");
    }

    playerStore.initializePlayerController();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    playerStore.exitPlayer();

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
            return FlickVideoPlayer(
              flickManager: playerStore.flickManager,
              flickVideoWithControls: FlickVideoWithControls(
                videoFit: BoxFit.contain,
                controls: FlickLandscapeControls(),
              ),
            );
          },
        ),
      ),
    );
  }
}
