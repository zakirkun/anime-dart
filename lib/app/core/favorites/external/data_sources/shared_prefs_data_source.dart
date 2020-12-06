import 'package:anime_dart/app/core/favorites/infra/data_sources/favorites_data_source.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsFavoritesDataSource implements FavoritesDataSource {
  final _favoriteListKey = "anime__dart__application__favorites__animes";
  final _favoritePrefix = "anime__dart__application__favorites__prefix";

  SharedPreferences _prefs;

  String _getFavoriteKey(String id) {
    return _favoritePrefix + id;
  }

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs != null) {
      return _prefs;
    }

    _prefs = await SharedPreferences.getInstance();

    return _prefs;
  }

  @override
  Future<bool> isFavorite(String id) async {
    try {
      final prefs = await _getPrefs();

      final favorite = prefs.getBool(_getFavoriteKey(id)) ?? false;

      return favorite;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> setFavorite(Anime anime, bool newValue) async {
    try {
      final prefs = await _getPrefs();

      prefs.setBool(_getFavoriteKey(anime.id), newValue);

      List<Anime> favoritesList = await getFavorites();

      int index = favoritesList.indexWhere((element) => element.id == anime.id);

      if (newValue) {
        if (index == -1) {
          favoritesList.insert(0, anime.copyWith(isFavorite: true));
        }
      } else {
        if (index != -1) {
          favoritesList.removeAt(index);
        }
      }

      final result = <String>[];

      for (final value in favoritesList) {
        result.add(value.toJson());
      }

      prefs.setStringList(_favoriteListKey, result);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Anime>> getFavorites() async {
    try {
      final prefs = await _getPrefs();

      final favoritesListString = prefs.getStringList(_favoriteListKey) ?? [];

      final favoritesList = <Anime>[];

      for (final f in favoritesListString) {
        favoritesList.add(Anime.fromJson(f));
      }

      return favoritesList;
    } catch (e) {
      throw e;
    }
  }
}
