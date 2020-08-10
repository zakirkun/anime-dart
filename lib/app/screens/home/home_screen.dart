import 'package:anime_dart/app/constants/tabs.dart';
import 'package:anime_dart/app/screens/about/about_screen.dart';
import 'package:anime_dart/app/screens/search/search_screen.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = getIt<HomeStore>();

  Future<bool> preventAcidentalExit() async {
    bool request = false;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tem certeza que deseja sair?"),
          content: Text(
            "Nem mais um episódio? É só 20 minutinhos!",
            style: TextStyle(height: 1.5),
          ),
          actions: [
            FlatButton(
              color: Theme.of(context).colorScheme.secondaryVariant,
              child: Text("Sim",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              onPressed: () {
                request = true;
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Não",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
              onPressed: () {
                request = false;
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    return request;
  }

  @override
  void dispose() {
    homeStore.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
            initialIndex: 0,
            length: MainTabs.tabs.length,
            child: Scaffold(
                appBar: AppBar(
                  title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Anime Dart",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(.60))),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AboutScreen()));
                            },
                            child: Container(
                                alignment: Alignment.centerRight,
                                height: 100,
                                width: 100,
                                child: Icon(OMIcons.code,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(.3))))
                      ]),
                  automaticallyImplyLeading: false,
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    isScrollable: true,
                    tabs: [
                      for (final tab in MainTabs.tabs)
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Tab(text: tab.label))
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    for (final tab in MainTabs.tabs) tab.builder(context)
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SearchScreen()));
                    },
                    child: Icon(Icons.search)))),
        onWillPop: preventAcidentalExit);
  }
}
