import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';
import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';

abstract class GetLatestEpisodes {
  Future<Either<BrowsingException, List<Episode>>> call();
}

class GetLatestEpisodesImplementation implements GetLatestEpisodes {
  final BrowsingRepository repository;

  GetLatestEpisodesImplementation({
    this.repository,
  });

  @override
  Future<Either<BrowsingException, List<Episode>>> call() async {
    try {
      final results = await repository.getLatestEpisodes();

      return results;
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred, and not was possible to fetch the Latests Episodes"));
    }
  }
}
