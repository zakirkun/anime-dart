import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:mobx/mobx.dart';
part 'anime_details_store.g.dart';

class AnimeDetailsStore = _AnimeDetailsStoreBase with _$AnimeDetailsStore;

abstract class _AnimeDetailsStoreBase with Store {
  final DetailsRepository repository;
  final FavoritesRepository favoritesRepository;
  final WatchedRepository watchedRepository;

  _AnimeDetailsStoreBase(
      {this.repository, this.favoritesRepository, this.watchedRepository});

  @observable
  AnimeDetails details;

  @observable
  ObservableList<EpisodeDetails> episodes;

  @observable
  String error;

  @observable
  String internalSearch = "";

  @observable
  var filteredEpisodes = ObservableList<EpisodeDetails>.of([]);

  @observable
  bool showSearch = false;

  @computed
  bool get searchMode => internalSearch != "";

  @computed
  bool get notFoundInternalSearch => searchMode && filteredEpisodes.length == 0;

  @computed
  bool get loading => episodes == null && details == null && error == null;

  @action
  loadDetails(String animeId) async {
    final result = await repository.getAnimeDetails(animeId);
    final resultEps = await repository.getEpisodesOf(animeId);

    runInAction(() {
      result.fold((l) {
        error = "Não foi possível carregar os dados do anime, tente novamente";
        details = null;
        episodes = null;
      }, (rAnime) {
        resultEps.fold((l) {
          error =
              "Não foi possível carregar os dados do anime, tente novamente";
          details = null;
          episodes = null;
        }, (rEpisodes) {
          details = rAnime;
          episodes = ObservableList<EpisodeDetails>.of(rEpisodes);
          error = null;
        });
      });
    });
  }

  @action
  showSearchField(bool yesOrNo) {
    showSearch = yesOrNo;
  }

  @action
  setInternalSearch(String keyword) {
    internalSearch = keyword;
  }

  @action
  closeSearchMode() {
    showSearchField(false);
    setInternalSearch("");
    filteredEpisodes = ObservableList<EpisodeDetails>.of([]);
  }

  @action
  filterEpisodes() {
    int length = episodes.length;

    filteredEpisodes = ObservableList<EpisodeDetails>.of([]);

    for (int i = length - 1; i >= 0; i--) {
      final episode = episodes[i];

      if (episode.label.contains(internalSearch)) {
        filteredEpisodes.add(episode);
      }
    }
  }

  @action
  Future<void> toggleFavorite() async {
    bool newValue = !details.isFavorite;

    final result = await favoritesRepository.setFavorite(details.id, newValue);

    runInAction(() {
      result.fold((l) {
        return;
      }, (r) {
        details = AnimeDetails(
            isFavorite: newValue,
            genres: details.genres,
            id: details.id,
            imageHttpHeaders: details.imageHttpHeaders,
            imageUrl: details.imageUrl,
            synopsis: details.synopsis,
            title: details.title,
            year: details.year);
      });
    });
  }

  @action
  Future<void> setEpisodeStats(String episodeId, double newStats) async {
    int index = episodes.indexWhere((element) => element.id == episodeId);

    if (index < 0) {
      return;
    }

    final result =
        await watchedRepository.setEpisodeWatchedStats(episodeId, newStats);

    final resultEps = await watchedRepository.getEpisodeWatchedStats(episodeId);

    runInAction(() {
      result.fold((_) => {}, (_) {
        resultEps.fold((l) => {}, (r) {
          episodes[index] = EpisodeDetails(
            animeId: episodes[index].animeId,
            id: episodes[index].id,
            imageHttpHeaders: episodes[index].imageHttpHeaders,
            imageUrl: episodes[index].imageUrl,
            stats: r,
            label: episodes[index].label,
            url: episodes[index].url,
            urlHd: episodes[index].urlHd,
          );
        });
      });
    });
  }

  @action
  dispose() {
    details = null;
    episodes = null;
    error = null;
    showSearch = false;
    internalSearch = "";
    filteredEpisodes = ObservableList<EpisodeDetails>.of([]);
  }
}
