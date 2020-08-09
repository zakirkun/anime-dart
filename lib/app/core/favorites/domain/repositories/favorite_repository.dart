import 'package:anime_dart/app/core/favorites/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepository {
  Future<Either<FavoritesException, bool>> isFavorite(String id);
  Future<Either<FavoritesException, void>> setFavorite(
      Anime anime, bool isFavorite);
  Future<Either<FavoritesException, List<Anime>>> getFavorites();
}
