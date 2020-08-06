import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:dartz/dartz.dart';
import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/entities/episode.dart';

abstract class BrowsingRepository {
  Future<Either<BrowsingException, List<Episode>>> getLatestEpisodes();

  Future<Either<BrowsingException, List<Anime>>> getTrendingAnimes();

  Future<Either<BrowsingException, List<Episode>>> getWatchedEpisodes();

  Future<Either<BrowsingException, List<Anime>>> getFavoriteAnimes();

  Future<Either<BrowsingException, List<Anime>>> getRandomAnimes();
}
