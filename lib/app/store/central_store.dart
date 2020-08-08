import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:mobx/mobx.dart';

import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:anime_dart/app/store/anime_details_store.dart';
import 'package:anime_dart/app/store/home_store.dart';
import 'package:anime_dart/app/store/watch_episode_store.dart';

part 'central_store.g.dart';

class CentralStore = _CentralStoreBase with _$CentralStore;

abstract class _CentralStoreBase with Store {
  final HomeStore homeStore;
  final WatchedRepository watchedRepository;
  final DetailsRepository detailsRepository;

  _CentralStoreBase({
    this.homeStore,
    this.watchedRepository,
    this.detailsRepository,
  });

  @observable
  var animeDetailsListeners = ObservableMap<String, AnimeDetailsStore>();

  @observable
  var watchEpisodeListeners = ObservableMap<String, WatchEpisodeStore>();

  @action
  String addAnimeDetailsListener(AnimeDetailsStore listener) {
    var newKey = 0;

    while (animeDetailsListeners.containsKey(newKey)) {
      newKey++;
    }

    animeDetailsListeners[newKey.toString()] = listener;

    return newKey.toString();
  }

  @action
  AnimeDetailsStore getAnimeDetailsListener(String key) {
    return animeDetailsListeners[key];
  }

  @action
  void removeAnimeDetailsListener(String key) {
    animeDetailsListeners.remove(key);
  }

  @action
  String addWatchEpisodeListener(WatchEpisodeStore listener) {
    var newKey = 0;

    while (watchEpisodeListeners.containsKey(newKey.toString())) {
      newKey++;
    }

    watchEpisodeListeners[newKey.toString()] = listener;

    return newKey.toString();
  }

  @action
  WatchEpisodeStore getWatchEpisodeListener(String key) {
    if (key == null) {
      throw Exception("Something is wrong, check this...");
    }

    return watchEpisodeListeners[key];
  }

  @action
  void removeWatchEpisodeListener(String key) {
    watchEpisodeListeners.remove(key);
  }

  @action
  Future<void> setEpisodeStats(String episodeId, double newStats) async {
    await watchedRepository.setEpisodeWatchedStats(episodeId, newStats);

    dispatchNewEpisode(episodeId, newStats);
  }

  @action
  void dispatchNewEpisode(String episodeId, double newStats) {
    animeDetailsListeners.forEach((_, value) {
      value.renderUpdatedEpisode(episodeId, newStats);
    });

    watchEpisodeListeners.forEach((_, value) {
      value.renderUpdatedEpisode(episodeId, newStats);
    });

    homeStore.renderUpdatedEpisode(episodeId, newStats);
  }
}
