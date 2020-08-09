import 'package:anime_dart/app/core/browsing/infra/models/episode_model.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

abstract class BrowsingDataSource {
  Future<List<EpisodeModel>> getLatestEpisodes();

  Future<List<Anime>> getTrendingAnimes();

  Future<List<EpisodeModel>> getWatchedEpisodes();

  Future<List<Anime>> getFavoriteAnimes();

  Future<List<Anime>> getRandomAnimes();
}
