import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetNextEpisodeDetails {
  Future<Either<DetailsException, EpisodeDetails>> call(String id);
}

class GetNextEpisodeDetailsImplementation implements GetNextEpisodeDetails {
  final DetailsRepository repository;

  GetNextEpisodeDetailsImplementation({
    this.repository,
  });

  @override
  Future<Either<DetailsException, EpisodeDetails>> call(String id) async {
    if (id == null || id.isEmpty) {
      return Left(
          InvalidIdException("The ID must be a valid and no-empty string"));
    }

    try {
      final result = await repository.getNextEpisodeDetails(id);

      return result;
    } on DetailsNotFoundException {
      return Left(
          DetailsNotFoundException("The requested resource ID not was found"));
    } catch (e) {
      return Left(
          FailedRequestException("The request failed for a unknown error"));
    }
  }
}
