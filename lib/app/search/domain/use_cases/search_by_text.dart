import 'package:anime_dart/app/search/domain/entities/result_search.dart';
import 'package:anime_dart/app/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<SearchException, List<SearchResult>>> call(String searchText);
}

class SearchByTextImplementation implements SearchByText {
  final SearchRepository repository;

  SearchByTextImplementation(this.repository);

  @override
  Future<Either<SearchException, List<SearchResult>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextException());
    }

    return repository.searchByText(searchText);
  }
}
