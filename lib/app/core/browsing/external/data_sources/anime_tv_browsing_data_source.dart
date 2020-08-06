import 'dart:convert';

import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/infra/data_sources/browsing_data_source.dart';
import 'package:anime_dart/app/core/browsing/infra/models/episode_model.dart';
import 'package:anime_dart/app/core/search/infra/models/anime_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

class AnimeTvBrowsingDataSource implements BrowsingDataSource {
  final _baseUrl = "https://appanimeplus.tk/api-achance.php";
  final _imageBaseUrl = "https://cdn.appanimeplus.tk/img/";
  final _httpHeaders = {
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36"
  };
  final _favoriteListKey = "anime__dart__application__favorites__animes";
  final _watchedListKey = "anime__dart__application__watched__episodes";

  final _minAnimeId = 3;
  final _maxAnimeId = 2715;

  Future<EpisodeModel> _getEpisodeFromId(String id) async {
    try {
      final response =
          await http.get(_baseUrl + "?episodios=$id", headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      final anime = await _getAnimeFromId(data["category_id"]);

      Map<String, dynamic> source = {
        "id": data["id"],
        "animeId": anime.id,
        "label": data["title"],
        "imageUrl": anime.imageUrl,
        "imageHttpHeaders": anime.imageHttpHeaders
      };

      final result = EpisodeModel.fromMap(source);

      return result;
    } catch (e) {
      throw e;
    }
  }

  String _getCompleteImageUrl(String imageId) {
    return _imageBaseUrl + imageId;
  }

  String _getRandomAnimeId() {
    return Utils.randomInt(_minAnimeId, _maxAnimeId).toString();
  }

  Future<AnimeModel> _getAnimeFromId(String id) async {
    try {
      final response =
          await http.get(_baseUrl + "?info=$id", headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      Map<String, dynamic> source = {
        "id": data["id"],
        "title": data["category_name"],
        "imageUrl": _getCompleteImageUrl(data["category_image"]),
        "imageHttpHeaders": _httpHeaders
      };

      final result = AnimeModel.fromMap(source);

      return result;
    } catch (e) {
      throw e;
    }
  }

  Future<AnimeModel> _getRandomAnime() async {
    try {
      String id = _getRandomAnimeId();

      final result = _getAnimeFromId(id);

      return result;
    } catch (e) {
      return await _getRandomAnime();
    }
  }

  @override
  Future<List<AnimeModel>> getFavoriteAnimes() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final favoritesId = prefs.getStringList(_favoriteListKey);

      final favorites = <AnimeModel>[];

      for (final favoriteId in favoritesId) {
        try {
          final anime = await _getAnimeFromId(favoriteId);

          favorites.add(anime);
        } catch (e) {}
      }

      return favorites;
    } catch (e) {
      throw UnableToFetchDataException("A internal server error");
    }
  }

  @override
  Future<List<EpisodeModel>> getLatestEpisodes() async {
    try {
      final response =
          await http.get(_baseUrl + "?latest", headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      final results = <EpisodeModel>[];

      for (final result in data) {
        Map<String, dynamic> source = {
          "id": result["video_id"],
          "animeId": result["category_id"],
          "label": result["title"],
          "imageUrl": _getCompleteImageUrl(result["category_image"]),
          "imageHttpHeaders": _httpHeaders
        };

        results.add(EpisodeModel.fromMap(source));
      }

      return results;
    } catch (e) {
      throw UnableToFetchDataException("A internal server error");
    }
  }

  @override
  Future<List<AnimeModel>> getRandomAnimes() async {
    return await Future.wait(List.generate(20, (_) => _getRandomAnime()));
  }

  @override
  Future<List<AnimeModel>> getTrendingAnimes() async {
    try {
      final response =
          await http.get(_baseUrl + "?populares", headers: _httpHeaders);

      final data = json.decode(response.body.substring(3));

      final results = <AnimeModel>[];

      for (final result in data) {
        Map<String, dynamic> source = {
          "id": result["id"],
          "title": result["category_name"],
          "imageUrl": _getCompleteImageUrl(result["category_image"]),
          "imageHttpHeaders": _httpHeaders
        };

        results.add(AnimeModel.fromMap(source));
      }

      return results;
    } catch (e) {
      throw UnableToFetchDataException("A internal server error");
    }
  }

  @override
  Future<List<EpisodeModel>> getWatchedEpisodes() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final watchedIds = prefs.getStringList(_watchedListKey);

      final watched = <EpisodeModel>[];

      for (final watchedId in watchedIds) {
        try {
          final episode = await _getEpisodeFromId(watchedId);

          watched.add(episode);
        } catch (e) {}
      }

      return watched;
    } catch (e) {
      throw UnableToFetchDataException("A internal server error");
    }
  }
}
