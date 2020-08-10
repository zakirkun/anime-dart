import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:mobx/mobx.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  final browsingRepository = getIt<BrowsingRepository>();

  @observable
  ObservableList<Anime> results;

  @observable
  String error;

  @computed
  bool get loading => error == null && results == null;

  @action
  Future<void> loadResults(String category) async {
    results = null;
    error = null;

    final response = await browsingRepository.getByCategory(category);

    runInAction(() {
      response.fold(
          (l) => error =
              "Ops, ocorreu um erro ao carregar os anime desta categoria", (r) {
        results = ObservableList<Anime>.of(r);
      });
    });
  }

  @action
  void dispose() {
    results = null;
    error = null;
  }

  @action
  void renderUpdatedFavorite(Anime anime, bool newValue) {
    if (results != null && results.length > 0) {
      int index = results.indexWhere((element) => element.id == anime.id);

      if (index != -1) {
        final aux = results[index];

        results[index] = Anime(
            id: aux.id,
            imageHttpHeaders: aux.imageHttpHeaders,
            imageUrl: aux.imageUrl,
            title: aux.title,
            isFavorite: newValue);
      }
    }
  }
}
