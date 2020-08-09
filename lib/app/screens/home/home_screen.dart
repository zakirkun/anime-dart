import 'package:anime_dart/app/constants/tabs.dart';
import 'package:anime_dart/app/screens/search/search_screen.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeStore = getIt<HomeStore>();

  @override
  void dispose() {
    homeStore.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: MainTabs.tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Anime Dart",
                  style: TextStyle(
                      color: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          .color
                          .withOpacity(.60))),
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
              children: [for (final tab in MainTabs.tabs) tab.builder(context)],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SearchScreen()));
                },
                child: Icon(Icons.search))));
  }
}
