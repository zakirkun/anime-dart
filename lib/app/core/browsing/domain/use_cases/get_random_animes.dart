import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

abstract class GetRandomAnimes {
  Future<Either<BrowsingException, List<Anime>>> call();
}

class GetRandomAnimesImplementation implements GetRandomAnimes {
  final BrowsingRepository repository;

  GetRandomAnimesImplementation({
    this.repository,
  });

  @override
  Future<Either<BrowsingException, List<Anime>>> call() async {
    try {
      final results = await repository.getRandomAnimes();

      return results;
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred, and not was possible to fetch the Random Animes"));
    }
  }
}
