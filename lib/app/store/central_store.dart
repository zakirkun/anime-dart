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
  String episodeIdPlaying;

  @observable
  String episodeUrlPlaying;

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

    while (watchEpisodeListeners.containsKey(newKey)) {
      newKey++;
    }

    watchEpisodeListeners[newKey.toString()] = listener;

    return newKey.toString();
  }

  @action
  WatchEpisodeStore getWatchEpisodeListener(String key) {
    return watchEpisodeListeners[key];
  }

  @action
  void removeWatchEpisodeListener(String key) {
    watchEpisodeListeners.remove(key);
  }

  @action
  Future<void> setEpisodeStats(String episodeId, double newStats) async {
    await watchedRepository.setEpisodeWatchedStats(episodeId, newStats);

    final result = await detailsRepository.getEpisodeDetails(episodeId);

    result.fold((l) => {}, (r) {
      dispatchNewEpisode(r);
    });
  }

  @action
  void dispatchNewEpisode(EpisodeDetails updatedEpisode) {
    animeDetailsListeners.forEach((_, value) {
      value.renderUpdatedEpisode(updatedEpisode);
    });

    watchEpisodeListeners.forEach((_, value) {
      value.renderUpdatedEpisode(updatedEpisode);
    });
  }

  // @action
  // void setPlayerEpisode(String targetEpisodeId, String url) {
  //   if (targetEpisodeId == null || url == null) {
  //     throw Exception(
  //         "Invalid. the Episode ID and URL must be String non-null");
  //   }

  //   episodeIdPlaying = targetEpisodeId;
  //   episodeUrlPlaying = url;
  // }
}
