import 'package:anime_dart/app/core/favorites/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/search/infra/models/anime_model.dart';
import 'package:dartz/dartz.dart';

abstract class SetFavorite {
  Future<Either<FavoritesException, void>> call(
      AnimeModel anime, bool isFavorite);
}

class SetFavoriteImplementation implements SetFavorite {
  final FavoritesRepository repository;

  const SetFavoriteImplementation({
    this.repository,
  });

  @override
  Future<Either<FavoritesException, void>> call(
      AnimeModel anime, bool isFavorite) async {
    if (anime == null || isFavorite == null) {
      return Left(
        RequestFavoriteFailed(
          "The requested resource ID must be a valid Anime ID (No-empty and no-null) and the isFavorite value must be != null",
        ),
      );
    }

    try {
      await repository.setFavorite(anime, isFavorite);

      return Right(null);
    } on RequestFavoriteFailed {
      return Left(
        RequestFavoriteFailed("Failed to execute the action to favorite anime"),
      );
    } catch (e) {
      return Left(
        RequestFavoriteFailed("Failed to execute the action to favorite anime"),
      );
    }
  }
}
