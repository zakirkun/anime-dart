import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import "package:dartz/dartz.dart";

abstract class SearchRepository {
  Future<Either<SearchException, List<Anime>>> searchByText(String searchText);

  Future<Either<SearchException, List<Anime>>> searchByLetter(
      String searchLetter);
}
