import 'package:anime_dart/app/search/domain/entities/result_search.dart';
import 'package:anime_dart/app/search/domain/errors/exceptions.dart';
import "package:dartz/dartz.dart";

abstract class SearchRepository {
  Future<Either<SearchException, List<SearchResult>>> searchByText(
      String searchText);
}
