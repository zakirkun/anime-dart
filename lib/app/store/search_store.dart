import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final searchRepository = getIt<SearchRepository>();

  @observable
  String text = "";

  @observable
  var results = ObservableList<Anime>.of([]);

  @observable
  bool notFound;

  @observable
  String error;

  @computed
  bool get waitingType => text == "";

  @computed
  bool get loading => text != "" && notFound == null && error == null;

  @action
  setText(value) {
    text = value;
  }

  @action
  Future<void> loadResults() async {
    notFound = null;
    error = null;

    final searchedAnimes =
        await searchRepository.searchByText(text.replaceAll(" ", "_"));

    runInAction(() {
      searchedAnimes.fold((l) {
        error = "Nenhum resultado encontrado";
        notFound = null;
      }, (r) {
        if (r.length == 0) {
          notFound = true;
        } else {
          results = ObservableList<Anime>.of([]);
          results = ObservableList<Anime>.of(r);
          notFound = false;
        }
        error = null;
      });
    });
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

  @action
  dispose() {
    text = "";
    results = ObservableList<Anime>.of([]);
    notFound = null;
    error = "";
  }
}
