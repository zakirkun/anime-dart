import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetEpisodeDetails {
  Future<Either<DetailsException, EpisodeDetails>> call(String id);
}

class GetEpisodeDetailsImplementation implements GetEpisodeDetails {
  final DetailsRepository repository;

  GetEpisodeDetailsImplementation({
    this.repository,
  });

  @override
  Future<Either<DetailsException, EpisodeDetails>> call(String id) async {
    if (id == null || id.isEmpty) {
      return Left(
          InvalidIdException("The ID must be a valid and no-empty string"));
    }

    try {
      final result = await repository.getEpisodeDetails(id);

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
