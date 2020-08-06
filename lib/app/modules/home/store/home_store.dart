import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

@Injectable()
abstract class _HomeStoreBase with Store {
  final BrowsingRepository repository;

  _HomeStoreBase({this.repository});

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

  @action
  dispose() {
    loadingLatests = true;
    latestsError = null;
    latests = null;

    loadingTrending = true;
    trendingError = null;
    trending = null;

    loadingRandom = true;
    randomError = null;
    random = null;
    loadingMoreRandom = false;
    randomLoadingMoreError = null;
  }
}
