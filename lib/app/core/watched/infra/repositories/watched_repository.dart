import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:anime_dart/app/core/watched/infra/data_sources/watched_data_source.dart';
import 'package:dartz/dartz.dart';

class WatchedRepositoryImplementation implements WatchedRepository {
  final WatchedDataSource dataSource;

  WatchedRepositoryImplementation({this.dataSource});

  @override
  Future<Either<WatchedException, double>> getEpisodeWatchedStats(
      String id) async {
    try {
      if (id == null || id.isEmpty) {
        Left(
            InvalidEpisodeIdException("The episode ID must be a valid String"));
      }

      final result = await dataSource.getEpisodeWatchedStats(id);

      return Right(result);
    } catch (e) {
      return Left(FailedRequestWatchedException("Unknown error, try again"));
    }
  }

  @override
  Future<Either<WatchedException, void>> setEpisodeWatchedStats(
    String id,
    double stats,
  ) async {
    try {
      if (id == null || id.isEmpty) {
        Left(
            InvalidEpisodeIdException("The episode ID must be a valid String"));
      }

      await dataSource.setEpisodeWatchedStats(id, stats);

      return Right(null);
    } catch (e) {
      return Left(FailedRequestWatchedException("Unknown error, try again"));
    }
  }

  @override
  Future<Either<WatchedException, String>> exportWatchedData() async {
    try {
      final data = await dataSource.exportWatchedData();

      return Right(data);
    } catch (e) {
      return Left(FailedRequestWatchedException("Unknown error, try again"));
    }
  }

  @override
  Future<Either<WatchedException, String>> importWatchedData(
    String source, {
    bool merge,
  }) async {
    try {
      await dataSource.importWatchedData(source, merge: merge);

      return Right(null);
    } catch (e) {
      return Left(FailedRequestWatchedException("Unknown error, try again"));
    }
  }

  @override
  Future<Either<WatchedException, void>> resetWatchedData() async {
    try {
      await dataSource.resetWatchedData();

      return Right(null);
    } catch (e) {
      return Left(FailedRequestWatchedException("Unknown error, try again"));
    }
  }
}
