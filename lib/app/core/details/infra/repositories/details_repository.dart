import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:anime_dart/app/core/details/infra/data_source/details_data_source.dart';

class DetailsRepositoryImplementation implements DetailsRepository {
  final DetailsDataSource dataSource;

  DetailsRepositoryImplementation({
    this.dataSource,
  });

  @override
  Future<Either<DetailsException, AnimeDetails>> getAnimeDetails(
      String id) async {
    try {
      final result = await dataSource.getAnimeDetails(id);

      if (result == null) {
        return Left(
            DetailsNotFoundException("Resources not found for this id: $id"));
      }

      return Right(result);
    } catch (e) {
      return Left(FailedRequestException(
          "An error ocurred on fetch data for this id: $id"));
    }
  }

  @override
  Future<Either<DetailsException, EpisodeDetails>> getEpisodeDetails(
      String id) async {
    try {
      final result = await dataSource.getEpisodeDetails(id);

      if (result == null) {
        return Left(
            DetailsNotFoundException("Resources not found for this id: $id"));
      }

      return Right(result);
    } catch (e) {
      return Left(FailedRequestException(
          "An error ocurred on fetch data for this id: $id"));
    }
  }

  @override
  Future<Either<DetailsException, EpisodeDetails>> getNextEpisodeDetails(
      String id) async {
    try {
      final result = await dataSource.getNextEpisodeDetails(id);

      if (result == null) {
        return Left(
            DetailsNotFoundException("Resources not found for this id: $id"));
      }

      return Right(result);
    } catch (e) {
      return Left(FailedRequestException(
          "An error ocurred on fetch data for this id: $id"));
    }
  }

  @override
  Future<Either<DetailsException, EpisodeDetails>> getPreviousEpisodeDetails(
      String id) async {
    try {
      final result = await dataSource.getPreviousEpisodeDetails(id);

      if (result == null) {
        return Left(
            DetailsNotFoundException("Resources not found for this id: $id"));
      }

      return Right(result);
    } catch (e) {
      return Left(FailedRequestException(
          "An error ocurred on fetch data for this id: $id"));
    }
  }

  @override
  Future<Either<DetailsException, List<EpisodeDetails>>> getEpisodesOf(
      String id) async {
    try {
      final results = await dataSource.getEpisodesOf(id);

      if (results == null || results.isEmpty) {
        return Left(
            DetailsNotFoundException("Resources not found for this id: $id"));
      }

      return Right(results);
    } catch (e) {
      return Left(FailedRequestException(
          "An error ocurred on fetch data for this id: $id"));
    }
  }
}
