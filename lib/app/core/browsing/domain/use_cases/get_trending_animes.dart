import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

abstract class GetTrendingAnimes {
  Future<Either<BrowsingException, List<Anime>>> call();
}

class GetTrendingAnimesImplementation implements GetTrendingAnimes {
  final BrowsingRepository repository;

  GetTrendingAnimesImplementation({
    this.repository,
  });

  @override
  Future<Either<BrowsingException, List<Anime>>> call() async {
    try {
      final results = await repository.getTrendingAnimes();

      return results;
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred, and not was possible to fetch the Trending Animes"));
    }
  }
}
