import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:diacritic/diacritic.dart';
import 'package:string_validator/string_validator.dart';

abstract class SearchByLetter {
  Future<Either<SearchException, List<Anime>>> call(String searchLetter);
}

class SearchByLetterImplementation implements SearchByLetter {
  final SearchRepository repository;

  SearchByLetterImplementation(this.repository);

  String _normalizeSearchLetter(String searchLetter) {
    return removeDiacritics(searchLetter).toLowerCase()[0];
  }

  bool _validSearchLetter(String searchLetter) {
    return isAlpha(searchLetter) || equals(searchLetter, "#");
  }

  @override
  Future<Either<SearchException, List<Anime>>> call(String searchLetter) async {
    if (searchLetter == null || searchLetter.isEmpty) {
      return Left(InvalidLetterException(
          "The search letter must be a valid and non-empty Char"));
    }

    searchLetter = _normalizeSearchLetter(searchLetter);

    if (!_validSearchLetter(searchLetter)) {
      return Left(InvalidLetterException(
          "The search letter must be a alpha char or '#'"));
    }

    return await repository.searchByLetter(searchLetter);
  }
}
