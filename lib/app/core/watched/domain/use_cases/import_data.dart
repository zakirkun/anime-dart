import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ImportWatchedData {
  Future<Either<WatchedException, void>> call(
    String source,
    bool merge,
  );
}

class ImportWatchedDataImplementation implements ImportWatchedData {
  final WatchedRepository repository;

  const ImportWatchedDataImplementation({
    this.repository,
  });

  @override
  Future<Either<WatchedException, void>> call(
    String source,
    bool merge,
  ) async {
    try {
      await repository.importWatchedData(source, merge: merge);

      return Right(null);
    } catch (e) {
      return Left(
        FailedRequestWatchedException("The request failed for a unknown error"),
      );
    }
  }
}
