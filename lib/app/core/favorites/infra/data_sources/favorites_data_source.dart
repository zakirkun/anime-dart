abstract class FavoritesDataSource {
  Future<bool> isFavorite(String id);
  Future<void> setFavorite(String id, bool isFavorite);
}
