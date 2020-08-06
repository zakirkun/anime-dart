import 'package:anime_dart/app/core/browsing/infra/models/episode_model.dart';
import 'package:anime_dart/app/core/search/infra/models/anime_model.dart';

abstract class BrowsingDataSource {
  Future<List<EpisodeModel>> getLatestEpisodes();

  Future<List<AnimeModel>> getTrendingAnimes();

  Future<List<EpisodeModel>> getWatchedEpisodes();

  Future<List<AnimeModel>> getFavoriteAnimes();

  Future<List<AnimeModel>> getRandomAnimes();
}
