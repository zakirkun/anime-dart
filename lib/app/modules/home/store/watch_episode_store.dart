import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'watch_episode_store.g.dart';

class WatchEpisodeStore = _WatchEpisodeStoreBase with _$WatchEpisodeStore;

abstract class _WatchEpisodeStoreBase with Store {
  final DetailsRepository repository;

  _WatchEpisodeStoreBase({this.repository});

  @observable
  EpisodeDetails episodeDetails;

  @observable
  bool loading = true;

  @observable
  bool loadingOtherEpisode = false;

  @observable
  String errorMsg;

  @action
  Future<void> loadEpisode(String episodeId) async {
    loading = true;

    final result = await repository.getEpisodeDetails(episodeId);

    runInAction(() {
      result.fold((l) {
        errorMsg =
            "Não foi possível carregar os detalhes desse episódio, tente novamente";
      }, (r) {
        errorMsg = null;
        episodeDetails = r;
      });

      loading = false;
    });
  }

  @action
  Future<void> loadNextEpisode(context) async {
    loadingOtherEpisode = true;

    final result = await repository.getNextEpisodeDetails(episodeDetails.id);

    runInAction(() {
      result.fold((l) {
        asuka.showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            duration: Duration(milliseconds: 4000),
            content: Container(
              padding: EdgeInsets.all(15),
              child: Text("Este foi o último episódio! :(",
                  style: TextStyle(fontFamily: "Raleway"),
                  textAlign: TextAlign.center),
            )));
      }, (r) {
        episodeDetails = r;
      });
      loadingOtherEpisode = false;
    });
  }

  @action
  Future<void> loadPrevEpisode(context) async {
    loadingOtherEpisode = true;

    final result =
        await repository.getPreviousEpisodeDetails(episodeDetails.id);

    runInAction(() {
      result.fold((l) {
        asuka.showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            duration: Duration(milliseconds: 4000),
            content: Container(
              padding: EdgeInsets.all(15),
              child: Text("Mas este é o primeiro episódio! =D",
                  style: TextStyle(fontFamily: "Raleway"),
                  textAlign: TextAlign.center),
            )));
      }, (r) {
        episodeDetails = r;
      });

      loadingOtherEpisode = false;
    });
  }

  @action
  void dispose() {
    episodeDetails = null;
    loading = true;
    errorMsg = null;
  }
}
