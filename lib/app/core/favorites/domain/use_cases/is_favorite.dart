import 'package:anime_dart/app/core/favorites/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IsFavorite {
  Future<Either<FavoritesException, bool>> call(String id);
}

class IsFavoriteImplementation implements IsFavorite {
  final FavoritesRepository repository;

  const IsFavoriteImplementation({
    this.repository,
  });

  @override
  Future<Either<FavoritesException, bool>> call(String id) async {
    if (id == null || id.isEmpty) {
      return Left(
        RequestFavoriteFailed(
          "The requested resource ID must be a valid Anime ID (No-empty and no-null)",
        ),
      );
    }

    try {
      final isFavorite = await repository.isFavorite(id);

      return isFavorite;
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
