import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:mobx/mobx.dart';
part 'anime_details_store.g.dart';

class AnimeDetailsStore = _AnimeDetailsStoreBase with _$AnimeDetailsStore;

abstract class _AnimeDetailsStoreBase with Store {
  final repository = getIt<BrowsingRepository>();
  final detailsRepository = getIt<DetailsRepository>();
  final favoritesRepository = getIt<FavoritesRepository>();
  final watchedRepository = getIt<WatchedRepository>();

  // ==========================
  //   ANIME DETAILS SCREEN STATE
  // ==========================
  @observable
  AnimeDetails animeDetails;

  @observable
  ObservableList<EpisodeDetails> episodesOfAnimeDetails;

  @observable
  String error;

  @observable
  String internalSearch = "";

  @observable
  var filteredEpisodes = ObservableList<EpisodeDetails>.of([]);

  @observable
  bool showSearch = false;

  @observable
  String episodeIdPlaying;

  @observable
  String episodeUrlPlaying;

  @observable
  String animeId;

  @computed
  bool get searchMode => internalSearch != "";

  @computed
  bool get notFoundInternalSearch => searchMode && filteredEpisodes.length == 0;

  @computed
  bool get loading =>
      episodesOfAnimeDetails == null && animeDetails == null && error == null;

  @action
  void setAnimeDetailsId(String newAnimeId) {
    animeId = newAnimeId;
  }

  @action
  Future<void> loadAnimeDetails() async {
    if (animeDetails != null && animeDetails.id == animeId) {
      return;
    } else {
      animeDetails = null;
      episodesOfAnimeDetails = null;
      error = null;
      internalSearch = "";
      filteredEpisodes = ObservableList<EpisodeDetails>.of([]);
      showSearch = false;
      episodeIdPlaying = null;
      episodeUrlPlaying = null;
    }

    final result = await detailsRepository.getAnimeDetails(animeId);
    final resultEps = await detailsRepository.getEpisodesOf(animeId);

    runInAction(() {
      result.fold((l) {
        error = "Não foi possível carregar os dados do anime, tente novamente";
        animeDetails = null;
        episodesOfAnimeDetails = null;
      }, (rAnime) {
        resultEps.fold((l) {
          error =
              "Não foi possível carregar os dados do anime, tente novamente";
          animeDetails = null;
          episodesOfAnimeDetails = null;
        }, (rEpisodes) {
          animeDetails = rAnime;
          episodesOfAnimeDetails = ObservableList<EpisodeDetails>.of(rEpisodes);
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
    int length = episodesOfAnimeDetails.length;

    filteredEpisodes = ObservableList<EpisodeDetails>.of([]);

    for (int i = length - 1; i >= 0; i--) {
      final episode = episodesOfAnimeDetails[i];

      if (episode.label.contains(internalSearch)) {
        filteredEpisodes.add(episode);
      }
    }
  }

  @action
  Future<void> toggleFavorite() async {
    bool newValue = !animeDetails.isFavorite;

    final result =
        await favoritesRepository.setFavorite(animeDetails.id, newValue);

    runInAction(() {
      result.fold((l) {
        return;
      }, (r) {
        animeDetails = AnimeDetails(
            isFavorite: newValue,
            genres: animeDetails.genres,
            id: animeDetails.id,
            imageHttpHeaders: animeDetails.imageHttpHeaders,
            imageUrl: animeDetails.imageUrl,
            synopsis: animeDetails.synopsis,
            title: animeDetails.title,
            year: animeDetails.year);
      });
    });
  }

  @action
  void renderUpdatedEpisode(EpisodeDetails updatedEpisode) {
    if (episodesOfAnimeDetails == null) {
      throw Exception(
          "The episodesOfAnimeDetails must be a valid ObservableList");
    }

    int index = episodesOfAnimeDetails
        .indexWhere((element) => element.id == updatedEpisode.id);

    if (index == -1) {
      throw Exception(
          "you really expected -1? its really ok? not badd? really?");
    }

    episodesOfAnimeDetails[index] = updatedEpisode;
  }
}
