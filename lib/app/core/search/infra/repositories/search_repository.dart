import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:anime_dart/app/core/search/infra/data_sources/search_data_source.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImplementation implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImplementation(this.dataSource);

  @override
  Future<Either<SearchException, List<Anime>>> searchByText(
      String searchText) async {
    try {
      final results = await dataSource.searchByText(searchText);

      if (results == null || results.isEmpty) {
        return Left(NotFoundResultsException("No match for this search"));
      }

      return Right(results);
    } on NotFoundResultsException {
      return Left(NotFoundResultsException("No match for this search"));
    } catch (e) {
      return Left(RequestException("Unknown error, try again"));
    }
  }

  @override
  Future<Either<SearchException, List<Anime>>> searchByLetter(
      String searchLetter) async {
    try {
      final results = await dataSource.searchByLetter(searchLetter);

      if (results == null || results.isEmpty) {
        return Left(NotFoundResultsException("No match for this search"));
      }
      return Right(results);
    } on NotFoundResultsException {
      return Left(NotFoundResultsException("No match for this search"));
    } catch (e) {
      return Left(RequestException("Unknown error, try again"));
    }
  }
}
