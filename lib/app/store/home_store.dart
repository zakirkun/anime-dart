import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final BrowsingRepository repository;
  final DetailsRepository detailsRepository;
  final FavoritesRepository favoritesRepository;
  final WatchedRepository watchedRepository;

  _HomeStoreBase(
      {this.repository,
      this.detailsRepository,
      this.favoritesRepository,
      this.watchedRepository});

  // ==========================
  //   LATEST SCREEN STATE
  // ==========================
  @observable
  ObservableList<Episode> latests;

  @observable
  bool loadingLatests = true;

  @observable
  String latestsError;

  @action
  Future<void> loadLatests() async {
    loadingLatests = true;

    final result = await repository.getLatestEpisodes();

    runInAction(() {
      result.fold((l) {
        latestsError = "Não foi possível carregar os últimos episódios";
        latests = null;
      }, (r) {
        latests = ObservableList<Episode>.of(r);
        latestsError = null;
      });

      loadingLatests = false;
    });
  }

  // ==========================
  //   TRENDING SCREEN STATE
  // ==========================
  @observable
  ObservableList<Anime> trending;

  @observable
  bool loadingTrending = true;

  @observable
  String trendingError;

  @action
  Future<void> loadTrending() async {
    loadingTrending = true;

    final result = await repository.getTrendingAnimes();

    runInAction(() {
      result.fold((l) {
        trendingError = "Não foi possível carregar os animes mais populares";
        trending = null;
      }, (r) {
        trending = ObservableList<Anime>.of(r);
        trendingError = null;
      });

      loadingTrending = false;
    });
  }

  // ==========================
  //   RANDOM SCREEN STATE
  // ==========================
  @observable
  ObservableList<Anime> random;

  @observable
  bool loadingRandom = true;

  @observable
  bool loadingMoreRandom = false;

  @observable
  String randomError;

  @observable
  String randomLoadingMoreError;

  @action
  Future<void> loadRandom() async {
    loadingRandom = true;

    final result = await repository.getRandomAnimes();

    runInAction(() {
      result.fold((l) {
        randomError = "Não foi possível carregar os animes aleatórios";
        random = null;
      }, (r) {
        random = ObservableList<Anime>.of(r);
        randomError = null;
      });

      loadingRandom = false;
    });
  }

  @action
  Future<void> loadMoreRandom() async {
    loadingMoreRandom = true;

    final result = await repository.getRandomAnimes();

    runInAction(() {
      result.fold((l) {
        randomLoadingMoreError = "Não foi possível carregar mais animes";
      }, (r) {
        random.addAll(ObservableList<Anime>.of(r));
        randomLoadingMoreError = null;
      });

      loadingMoreRandom = false;
    });
  }

  // ==========================
  //   FAVORITES SCREEN STATE
  // ==========================
  @observable
  ObservableList<Anime> favorites;

  @observable
  bool loadingFavorites = true;

  @observable
  String favoritesError;

  @computed
  bool get emptyFavoriteList => favorites != null && favorites.length == 0;

  @action
  Future<void> loadFavorites() async {
    loadingFavorites = true;

    final result = await repository.getFavoriteAnimes();

    runInAction(() {
      result.fold((l) {
        favoritesError = "Não foi possível carregar os seus animes favoritos";
        favorites = null;
      }, (r) {
        favorites = ObservableList<Anime>.of(r);
        favoritesError = null;
      });

      loadingFavorites = false;
    });
  }

  @action
  void renderUpdatedEpisode(String id, double newStats) {
    if (latests != null && latests.length > 0) {
      int index = latests.indexWhere((element) => element.id == id);

      if (index != -1) {
        final aux = latests[index];

        latests[index] = Episode(
            animeId: aux.animeId,
            id: aux.id,
            imageHttpHeaders: aux.imageHttpHeaders,
            imageUrl: aux.imageUrl,
            label: aux.label,
            stats: newStats);
      }
    }
  }

  @action
  void renderUpdatedFavorite(Anime anime, bool newValue) {
    if (random != null && random.length > 0) {
      int index = random.indexWhere((element) => element.id == anime.id);

      if (index != -1) {
        final aux = random[index];

        random[index] = Anime(
            id: aux.id,
            imageHttpHeaders: aux.imageHttpHeaders,
            imageUrl: aux.imageUrl,
            title: aux.title,
            isFavorite: newValue);
      }
    }

    if (favorites != null && favorites.length > 0) {
      int index = favorites.indexWhere((element) => element.id == anime.id);

      if (index != -1) {
        final aux = favorites[index];

        favorites[index] = Anime(
            id: aux.id,
            imageHttpHeaders: aux.imageHttpHeaders,
            imageUrl: aux.imageUrl,
            title: aux.title,
            isFavorite: newValue);
      } else if (newValue) {
        favorites.insert(0, anime.copyWith(isFavorite: newValue));
      }
    }
  }

  @action
  void dispose() {}
}
