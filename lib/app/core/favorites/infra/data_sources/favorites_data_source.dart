import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

abstract class FavoritesDataSource {
  Future<bool> isFavorite(String id);
  Future<void> setFavorite(Anime anime, bool isFavorite);
  Future<List<Anime>> getFavorites();
}
