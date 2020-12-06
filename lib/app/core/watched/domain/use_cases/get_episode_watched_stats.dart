import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetEpisodeWatchedStats {
  Future<Either<WatchedException, void>> call(String id);
}

class GetEpisodeWatchedStatsImplementation implements GetEpisodeWatchedStats {
  final WatchedRepository repository;

  const GetEpisodeWatchedStatsImplementation({
    this.repository,
  });

  @override
  Future<Either<WatchedException, void>> call(String id) async {
    if (id == null || id.isEmpty) {
      return Left(InvalidEpisodeIdException(
          "The ID must be a valid and no-empty string"));
    }

    try {
      await repository.getEpisodeWatchedStats(id);

      return Right(null);
    } catch (e) {
      return Left(FailedRequestWatchedException(
          "The request failed for a unknown error"));
    }
  }
}
