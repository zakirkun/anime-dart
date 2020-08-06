import 'package:anime_dart/app/core/details/domain/entities/anime_details.dart';
import 'package:anime_dart/app/core/details/domain/entities/episode_details.dart';
import 'package:anime_dart/app/core/details/domain/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepository {
  Future<Either<DetailsException, EpisodeDetails>> getEpisodeDetails(String id);
  Future<Either<DetailsException, AnimeDetails>> getAnimeDetails(String id);
  Future<Either<DetailsException, EpisodeDetails>> getNextEpisodeDetails(
      String id);
  Future<Either<DetailsException, EpisodeDetails>> getPreviousEpisodeDetails(
      String id);
  Future<Either<DetailsException, List<EpisodeDetails>>> getEpisodesOf(
      String id);
}
