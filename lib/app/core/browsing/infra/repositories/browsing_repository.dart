import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';
import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/browsing/infra/data_sources/browsing_data_source.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

class BrowsingRepositoryImplementation implements BrowsingRepository {
  final BrowsingDataSource dataSource;

  BrowsingRepositoryImplementation({
    this.dataSource,
  });

  Future<Either<BrowsingException, List<Episode>>> getLatestEpisodes() async {
    try {
      final results = await dataSource.getLatestEpisodes();

      return Right(results);
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred on fetch the latest episodes"));
    }
  }

  Future<Either<BrowsingException, List<Anime>>> getTrendingAnimes() async {
    try {
      final results = await dataSource.getTrendingAnimes();

      return Right(results);
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred on fetch the trending animes"));
    }
  }

  Future<Either<BrowsingException, List<Episode>>> getWatchedEpisodes() async {
    try {
      final results = await dataSource.getWatchedEpisodes();

      return Right(results);
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred on fetch the watched episodes"));
    }
  }

  Future<Either<BrowsingException, List<Anime>>> getFavoriteAnimes() async {
    try {
      final results = await dataSource.getFavoriteAnimes();

      return Right(results);
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred on fetch the favorites animes"));
    }
  }

  Future<Either<BrowsingException, List<Anime>>> getRandomAnimes() async {
    try {
      final results = await dataSource.getRandomAnimes();

      return Right(results);
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred on fetch the random animes"));
    }
  }

  @override
  Future<Either<BrowsingException, List<Anime>>> getByCategory(
      String category) async {
    try {
      final results = await dataSource.getByCategory(category);

      return Right(results);
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred on fetch the random animes"));
    }
  }
}
