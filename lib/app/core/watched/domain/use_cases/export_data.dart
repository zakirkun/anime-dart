import 'package:anime_dart/app/core/watched/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/watched/domain/repository/watched_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ExportWatchedData {
  Future<Either<WatchedException, void>> call();
}

class ExportWatchedDataImplementation implements ExportWatchedData {
  final WatchedRepository repository;

  const ExportWatchedDataImplementation({
    this.repository,
  });

  @override
  Future<Either<WatchedException, void>> call() async {
    try {
      final source = await repository.exportWatchedData();

      return Right(source);
    } catch (e) {
      return Left(
        FailedRequestWatchedException("The request failed for a unknown error"),
      );
    }
  }
}
