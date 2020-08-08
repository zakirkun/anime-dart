import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:mobx/mobx.dart';
part 'watch_episode_store.g.dart';

class WatchEpisodeStore = _WatchEpisodeStoreBase with _$WatchEpisodeStore;

abstract class _WatchEpisodeStoreBase with Store {
  final detailsRepository = getIt<DetailsRepository>();
  final centralStore = getIt<CentralStore>();

  // ==================
  // WATCH EPISODES STORE
  // ==================
  @observable
  EpisodeDetails episodeDetails;

  @observable
  bool loadingWatchEpisode = true;

  @observable
  bool loadingOtherEpisode = false;

  @observable
  String errorMsg;

  @observable
  String episodeId;

  @observable
  String watchEpisodeId;

  @action
  Future<void> loadEpisode() async {
    final episodeId = watchEpisodeId;

    if (episodeDetails != null && episodeDetails.id == episodeId) {
      return;
    } else {
      episodeDetails = null;
      loadingWatchEpisode = true;
      loadingOtherEpisode = false;
      errorMsg = null;
    }

    final result = await detailsRepository.getEpisodeDetails(episodeId);

    runInAction(() {
      result.fold((l) {
        errorMsg =
            "Não foi possível carregar os detalhes desse episódio, tente novamente";
      }, (r) {
        errorMsg = null;
        episodeDetails = r;
      });

      loadingWatchEpisode = false;
    });
  }

  @action
  Future<void> loadNextEpisode() async {
    loadingOtherEpisode = true;

    final result =
        await detailsRepository.getNextEpisodeDetails(episodeDetails.id);

    runInAction(() {
      result.fold((l) {}, (r) {
        episodeDetails = r;
      });
      loadingOtherEpisode = false;
    });
  }

  @action
  Future<void> loadPrevEpisode() async {
    loadingOtherEpisode = true;

    final result =
        await detailsRepository.getPreviousEpisodeDetails(episodeDetails.id);

    runInAction(() {
      result.fold((l) {}, (r) {
        episodeDetails = r;
      });

      loadingOtherEpisode = false;
    });
  }

  @action
  void setWatchEpisodeId(String newEpisodeId) {
    watchEpisodeId = newEpisodeId;
  }

  @action
  void renderUpdatedEpisode(String id, double newStats) {
    if (episodeDetails.id == id) {
      episodeDetails = EpisodeDetails(
          animeId: episodeDetails.animeId,
          id: episodeDetails.id,
          imageHttpHeaders: episodeDetails.imageHttpHeaders,
          imageUrl: episodeDetails.imageUrl,
          label: episodeDetails.label,
          stats: newStats,
          url: episodeDetails.url,
          urlHd: episodeDetails.urlHd);
    }
  }
}
