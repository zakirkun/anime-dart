import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:mobx/mobx.dart';
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
  void dispose() {
    loading = true;
    errorMsg = null;
    episodeDetails = null;
  }
}
