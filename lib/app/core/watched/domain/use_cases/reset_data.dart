import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ResetWatchedData {
  Future<Either<WatchedException, void>> call();
}

class ResetWatchedDataImplementation implements ResetWatchedData {
  final WatchedRepository repository;

  const ResetWatchedDataImplementation({
    this.repository,
  });

  @override
  Future<Either<WatchedException, void>> call() async {
    try {
      await repository.resetWatchedData();

      return Right(null);
    } catch (e) {
      return Left(
        FailedRequestWatchedException("The request failed for a unknown error"),
      );
    }
  }
}
