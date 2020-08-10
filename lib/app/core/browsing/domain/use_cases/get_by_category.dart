import 'package:dartz/dartz.dart';

import 'package:anime_dart/app/core/browsing/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/browsing/domain/repositories/browsing_repository.dart';
import 'package:anime_dart/app/core/search/domain/entities/anime.dart';

abstract class GetByCategory {
  Future<Either<BrowsingException, List<Anime>>> call(String category);
}

class GetByCategoryImplementation implements GetByCategory {
  final BrowsingRepository repository;

  GetByCategoryImplementation({
    this.repository,
  });

  @override
  Future<Either<BrowsingException, List<Anime>>> call(String category) async {
    try {
      final response = await repository.getByCategory(category);

      return response;
    } catch (e) {
      return Left(UnableToFetchDataException(
          "An error ocurred, and not was possible to fetch the Favorite Animes"));
    }
  }
}
