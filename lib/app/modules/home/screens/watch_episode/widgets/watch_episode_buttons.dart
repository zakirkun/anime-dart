import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/modules/home/screens/watch_episode/widgets/ripple_button.dart';
import 'package:flutter/material.dart';

class WatchButtons extends StatelessWidget {
  final String videoUrlHd;
  final String videoUrl;

  WatchButtons({this.videoUrlHd, @required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Assistir Online:",
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.5)))),
            videoUrlHd == null
                ? (RippleButton(
                    color: Colors.black26,
                    onTap: () {},
                    label: "Esse episódio não está disponível em HD"))
                : (RippleButton(
                    color: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      if (videoUrlHd == null) {
                        return;
                      }

                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return Player(
                      //     url: videoUrlHd,
                      //   );
                      // }));
                    },
                    label: "Assistir em HD")),
            RippleButton(
                color: Theme.of(context).colorScheme.secondaryVariant,
                onTap: () {
                  if (videoUrl == null) {
                    return;
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //   return Player(url: videoUrl);
                  // }));
                },
                label: "Assistir"),
          ]),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Fazer Download:",
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.5)))),
            videoUrlHd == null
                ? (RippleButton(
                    color: Colors.black26,
                    onTap: () {},
                    label: "Esse episódio não está disponível em HD"))
                : (RippleButton(
                    color: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      if (videoUrlHd == null) {
                        return;
                      }
                      Utils.openUrl(videoUrlHd);
                    },
                    label: "Download em HD")),
            RippleButton(
                color: Theme.of(context).colorScheme.secondaryVariant,
                onTap: () async {
                  if (videoUrl == null) {
                    return;
                  }

                  try {
                    await Utils.openUrl(videoUrl);
                  } catch (e) {
                    print(e);
                  }
                },
                label: "Download"),
          ]),
        )
      ]),
    );
  }
}
