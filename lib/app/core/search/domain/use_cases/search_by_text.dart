import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:diacritic/diacritic.dart';

abstract class SearchByText {
  Future<Either<SearchException, List<Anime>>> call(String searchText);
}

class SearchByTextImplementation implements SearchByText {
  final SearchRepository repository;

  SearchByTextImplementation(this.repository);

  String _normalizeSearchText(String searchText) {
    final specialSymbols = RegExp(r"[_\-=@,\.; ]");

    return removeDiacritics(searchText)
        .replaceAll(specialSymbols, "_")
        .toLowerCase();
  }

  @override
  Future<Either<SearchException, List<Anime>>> call(String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextException(
          "The search text must be a valid and non-empty String"));
    }

    searchText = _normalizeSearchText(searchText);

    return await repository.searchByText(searchText);
  }
}
