import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SetEpisodeWatchedStats {
  Future<Either<WatchedException, void>> call(String id, double stats);
}

class SetEpisodeWatchedStatsImplementation implements SetEpisodeWatchedStats {
  final WatchedRepository repository;

  const SetEpisodeWatchedStatsImplementation({
    this.repository,
  });

  @override
  Future<Either<WatchedException, void>> call(String id, double stats) async {
    assert(stats >= 0 && stats <= 100);

    if (id == null || id.isEmpty || stats == null) {
      return Left(InvalidEpisodeIdException(
          "The ID must be a valid and no-empty string"));
    }

    try {
      await repository.setEpisodeWatchedStats(id, stats);

      return Right(null);
    } catch (e) {
      return Left(FailedRequestWatchedException(
          "The request failed for a unknown error"));
    }
  }
}
