import 'package:anime_dart/app/core/favorites/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SetFavorite {
  Future<Either<FavoritesException, void>> call(String id, bool isFavorite);
}

class SetFavoriteImplementation implements SetFavorite {
  final FavoritesRepository repository;

  SetFavoriteImplementation({
    this.repository,
  });

  @override
  Future<Either<FavoritesException, void>> call(
      String id, bool isFavorite) async {
    if (id == null || id.isEmpty || isFavorite == null) {
      return Left(RequestFavoriteFailed(
          "The requested resource ID must be a valid Anime ID (No-empty and no-null) and the isFavorite value must be != null"));
    }

    try {
      await repository.setFavorite(id, isFavorite);

      return Right(null);
    } on RequestFavoriteFailed {
      return Left(RequestFavoriteFailed(
          "Failed to execute the action to favorite anime"));
    } catch (e) {
      return Left(RequestFavoriteFailed(
          "Failed to execute the action to favorite anime"));
    }
  }
}
