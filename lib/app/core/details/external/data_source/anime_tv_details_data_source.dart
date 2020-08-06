import 'dart:convert';

import 'package:anime_dart/app/core/details/infra/data_source/details_data_source.dart';
import "package:http/http.dart" as http;

import 'package:anime_dart/app/core/details/infra/models/anime_details_model.dart';
import 'package:anime_dart/app/core/details/infra/models/episode_details_model.dart';

class AnimeTvDetailsDataSource implements DetailsDataSource {
  final _baseUrl = "https://appanimeplus.tk/api-achance.php";
  final _imageBaseUrl = "https://cdn.appanimeplus.tk/img/";
  final _httpHeaders = {
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36"
  };

  String _getCompleteImageUrl(String imageId) {
    return _imageBaseUrl + imageId;
  }

  @override
  Future<AnimeDetailsModel> getAnimeDetails(String id) async {
    try {
      final response =
          await http.get(_baseUrl + "?info=$id", headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      Map<String, dynamic> source = {
        "id": data["id"],
        "title": data["category_name"],
        "synopsis": data["category_name"],
        "imageUrl": _getCompleteImageUrl(data["category_image"]),
        "imageHttpHeaders": _httpHeaders,
        "year": data["ano"],
        "genres": data["category_genres"].replaceAll(" ", "").split(","),
      };

      final result = AnimeDetailsModel.fromMap(source);

      return result;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<EpisodeDetailsModel> getEpisodeDetails(String id) async {
    try {
      final response =
          await http.get(_baseUrl + "?episodios=$id", headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      final ownerAnime = await getAnimeDetails(data["category_id"]);

      Map<String, dynamic> source = {
        "id": data["video_id"],
        "animeId": data["category_id"],
        "label": data["title"],
        "url": data["location"],
        "urlHd": data["locationsd"],
        "imageUrl": ownerAnime.imageUrl,
        "imageHttpHeaders": ownerAnime.imageHttpHeaders,
      };

      final result = EpisodeDetailsModel.fromMap(source);

      return result;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<EpisodeDetailsModel> getNextEpisodeDetails(String id) async {
    try {
      final currentEpisode = await getEpisodeDetails(id);

      final ownerAnime = await getAnimeDetails(currentEpisode.animeId);

      final response = await http.get(
          _baseUrl +
              "?episodios=${currentEpisode.id}&catid=${ownerAnime.id}&next",
          headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      Map<String, dynamic> source = {
        "id": data["video_id"],
        "animeId": data["category_id"],
        "label": data["title"],
        "url": data["location"],
        "urlHd": data["locationsd"],
        "imageUrl": ownerAnime.imageUrl,
        "imageHttpHeaders": ownerAnime.imageHttpHeaders,
      };

      final nextEpisode = EpisodeDetailsModel.fromMap(source);

      return nextEpisode;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<EpisodeDetailsModel> getPreviousEpisodeDetails(String id) async {
    try {
      final currentEpisode = await getEpisodeDetails(id);

      final ownerAnime = await getAnimeDetails(currentEpisode.animeId);

      final response = await http.get(
          _baseUrl +
              "?episodios=${currentEpisode.id}&catid=${ownerAnime.id}&previous",
          headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      Map<String, dynamic> source = {
        "id": data["video_id"],
        "animeId": data["category_id"],
        "label": data["title"],
        "url": data["location"],
        "urlHd": data["locationsd"],
        "imageUrl": ownerAnime.imageUrl,
        "imageHttpHeaders": ownerAnime.imageHttpHeaders,
      };

      final previousEpisode = EpisodeDetailsModel.fromMap(source);

      return previousEpisode;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<EpisodeDetailsModel>> getEpisodesOf(String id) async {
    try {
      final targetAnime = await getAnimeDetails(id);

      final response = await http.get(_baseUrl + "?cat_id=${targetAnime.id}",
          headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      final episodes = <EpisodeDetailsModel>[];

      for (final episode in data) {
        Map<String, dynamic> source = {
          "id": episode["video_id"],
          "animeId": episode["category_id"],
          "label": episode["title"],
          "url": episode["location"],
          "urlHd": episode["locationsd"],
          "imageUrl": targetAnime.imageUrl,
          "imageHttpHeaders": targetAnime.imageHttpHeaders,
        };

        episodes.add(EpisodeDetailsModel.fromMap(source));
      }

      return episodes;
    } catch (e) {
      throw e;
    }
  }
}
