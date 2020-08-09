import 'dart:async';
import 'package:anime_dart/app/screens/search/widgets/search_list.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:anime_dart/app/store/search_store.dart';
import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String storeListenerKey;
  final localStore = SearchStore();
  final centralStore = getIt<CentralStore>();

  final searchQuery = TextEditingController();
  Timer debounce;

  void _onSearchChanged() {
    if (debounce?.isActive ?? false) {
      debounce.cancel();
    }

    debounce = Timer(const Duration(milliseconds: 500), () {
      final text = searchQuery.text;

      if (text == localStore.text) {
        return;
      }

      localStore.setText(text);
      localStore.loadResults();
    });
  }

  @override
  void initState() {
    super.initState();
    storeListenerKey = centralStore.addSearchListener(localStore);
    searchQuery.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchQuery?.removeListener(_onSearchChanged);
    searchQuery?.dispose();
    debounce?.cancel();

    localStore.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            backgroundColor: Theme.of(context).cardColor,
            title: TextField(
                autofocus: true,
                cursorColor: Theme.of(context).textTheme.bodyText1.color,
                decoration: InputDecoration.collapsed(
                    hintStyle: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.5)),
                    hintText: 'Digite uma palavra chave'),
                controller: searchQuery)),
        body: Observer(
          builder: (_) {
            if (localStore.waitingType) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Digite o nome de um anime para procurar...")))
                ],
              );
            }

            if (localStore.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (localStore.error != null) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(30),
                child: Text(localStore.error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                    )),
              );
            }

            if (localStore.notFound) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                              "Anime não encontrado, tente outra palavra chave...")))
                ],
              );
            }

            return SearchList(storeListenerKey: storeListenerKey);
          },
        ));
  }
}
