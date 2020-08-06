import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/details/domain/repository/details_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetAnimeDetails {
  Future<Either<DetailsException, AnimeDetails>> call(String id);
}

class GetAnimeDetailsImplementation implements GetAnimeDetails {
  final DetailsRepository repository;

  GetAnimeDetailsImplementation({
    this.repository,
  });

  @override
  Future<Either<DetailsException, AnimeDetails>> call(String id) async {
    if (id == null || id.isEmpty) {
      return Left(
          InvalidIdException("The ID must be a valid and no-empty string"));
    }

    try {
      final result = await repository.getAnimeDetails(id);

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
