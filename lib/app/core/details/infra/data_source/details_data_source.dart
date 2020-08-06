import 'package:anime_dart/app/core/details/infra/models/anime_details_model.dart';
import 'package:anime_dart/app/core/details/infra/models/episode_details_model.dart';

abstract class DetailsDataSource {
  Future<EpisodeDetailsModel> getEpisodeDetails(String id);
  Future<AnimeDetailsModel> getAnimeDetails(String id);
  Future<EpisodeDetailsModel> getNextEpisodeDetails(String id);
  Future<EpisodeDetailsModel> getPreviousEpisodeDetails(String id);
  Future<List<EpisodeDetailsModel>> getEpisodesOf(String id);
}
