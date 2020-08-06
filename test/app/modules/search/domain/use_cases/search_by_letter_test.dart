import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:anime_dart/app/core/search/domain/use_cases/search_by_letter.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final searchByLetter = SearchByLetterImplementation(repository);

  test('should return InvalidLetterException if text is null or empty',
      () async {
    final result = await searchByLetter(null);

    expect(result.fold(id, id), isA<InvalidLetterException>());
  });

  test('should return a Anime List', () async {
    when(repository.searchByLetter("a"))
        .thenAnswer((_) async => right(<Anime>[Anime()]));

    final result = await searchByLetter("a");

    expect(result | null, isA<List<Anime>>());
  });

  test('should return InvalidLetterException if letter is invalid', () async {
    final result = await searchByLetter("~");

    expect(result.fold(id, id), isA<InvalidLetterException>());
  });

  test('should return InvalidLetterException if letter is null or empty',
      () async {
    final result = await searchByLetter(null);

    expect(result.fold(id, id), isA<InvalidLetterException>());
  });

  test(
      'should return a NotFoundResultsException if the letter query not found results',
      () async {
    when(repository.searchByLetter("z")).thenAnswer((_) async =>
        left<NotFoundResultsException, List<Anime>>(
            NotFoundResultsException("No match any results")));

    final result = await searchByLetter("z");

    expect(result.fold(id, id), isA<NotFoundResultsException>());
  });
}
