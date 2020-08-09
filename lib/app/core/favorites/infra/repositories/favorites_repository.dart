import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/favorites/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/favorites/domain/repositories/favorite_repository.dart';
import 'package:anime_dart/app/core/favorites/infra/data_sources/favorites_data_source.dart';

class FavoritesRepositoryImplementation implements FavoritesRepository {
  final FavoritesDataSource dataSource;

  FavoritesRepositoryImplementation({
    this.dataSource,
  });

  @override
  Future<Either<FavoritesException, bool>> isFavorite(String id) async {
    try {
      final result = await dataSource.isFavorite(id);

      return Right(result);
    } catch (e) {
      return Left(RequestFavoriteFailed("Unable to read favorite stats"));
    }
  }

  @override
  Future<Either<FavoritesException, void>> setFavorite(
      Anime anime, bool isFavorite) async {
    try {
      await dataSource.setFavorite(anime, isFavorite);

      return Right(null);
    } catch (e) {
      return Left(RequestFavoriteFailed("Unable to set favorite stats"));
    }
  }

  @override
  Future<Either<FavoritesException, List<Anime>>> getFavorites() async {
    try {
      final result = await dataSource.getFavorites();

      return Right(result);
    } catch (e) {
      return Left(RequestFavoriteFailed("Unable to read favorite stats"));
    }
  }
}
