import 'package:anime_dart/app/core/search/infra/models/anime_model.dart';

abstract class SearchDataSource {
  Future<List<AnimeModel>> searchByText(String searchText);
  Future<List<AnimeModel>> searchByLetter(String searchLetter);
}
