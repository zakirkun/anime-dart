import 'package:anime_dart/app/core/search/domain/entities/anime.dart';
import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/domain/repositories/search_repository.dart';
import 'package:anime_dart/app/core/search/domain/use_cases/search_by_text.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final searchByText = SearchByTextImplementation(repository);

  test('should return InvalidTextException if text is null or empty', () async {
    final result = await searchByText(null);

    expect(result.fold(id, id), isA<InvalidTextException>());
  });

  test('should return a Anime List', () async {
    when(repository.searchByText("youjo"))
        .thenAnswer((_) async => right(<Anime>[Anime()]));

    final result = await searchByText("youjo");

    expect(result | null, isA<List<Anime>>());
  });

  test('should return InvalidTextException if text is null or empty', () async {
    final result = await searchByText(null);

    expect(result.fold(id, id), isA<InvalidTextException>());
  });

  test(
      'should return a NotFoundResultsException if the text query not found results',
      () async {
    when(repository.searchByText("any_crazy_query")).thenAnswer((_) async =>
        left<NotFoundResultsException, List<Anime>>(
            NotFoundResultsException("No match any results")));

    final result = await searchByText("any_crazy_query");

    expect(result.fold(id, id), isA<NotFoundResultsException>());
  });
}
