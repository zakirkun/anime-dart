import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

abstract class GetFavoriteAnimes {
  Future<Either<BrowsingException, List<Anime>>> call();
}

class GetFavoriteAnimesImplementation implements GetFavoriteAnimes {
  final BrowsingRepository repository;

  GetFavoriteAnimesImplementation({
    this.repository,
  });

  @override
  Future<Either<BrowsingException, List<Anime>>> call() async {
    try {
      final results = await repository.getFavoriteAnimes();

      return results;
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred, and not was possible to fetch the Favorite Animes"));
    }
  }
}
