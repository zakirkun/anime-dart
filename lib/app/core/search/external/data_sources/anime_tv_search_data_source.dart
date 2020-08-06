import 'dart:convert';

import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/infra/data_sources/search_data_source.dart';
import 'package:anime_dart/app/core/search/infra/models/anime_model.dart';
import "package:http/http.dart" as http;

class AnimeTvDataSource implements SearchDataSource {
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
  Future<List<AnimeModel>> searchByText(String searchText) async {
    try {
      final response = await http.get(_baseUrl + "?search=$searchText",
          headers: _httpHeaders);

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
      throw NotFoundResultsException("No results found for this search query");
    }
  }

  @override
  Future<List<AnimeModel>> searchByLetter(String searchLetter) async {
    try {
      final response = await http.get(_baseUrl + "?letra=$searchLetter",
          headers: _httpHeaders);

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
      throw NotFoundResultsException("No results found for this search query");
    }
  }
}
