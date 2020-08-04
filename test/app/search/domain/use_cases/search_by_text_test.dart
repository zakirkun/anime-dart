import 'package:anime_dart/app/search/domain/entities/result_search.dart';
import 'package:anime_dart/app/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/search/domain/repositories/search_repository.dart';
import 'package:anime_dart/app/search/domain/use_cases/search_by_text.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final searchByText = SearchByTextImplementation(repository);

  test('should return a SearchResult List', () async {
    when(repository.searchByText("youjo"))
        .thenAnswer((_) async => right(<SearchResult>[SearchResult()]));

    var result = await searchByText("youjo");

    expect(result | null, isA<List<SearchResult>>());
  });

  test('should return InvalidTextException if text is null or empty', () async {
    var result = await searchByText(null);

    expect(result.fold(id, id), isA<InvalidTextException>());
  });

  test(
      'should return a NotFoundResultsException if the text query not found results',
      () async {
    when(repository.searchByText("any_crazy_query")).thenAnswer((_) async =>
        left<NotFoundResultsException, List<SearchResult>>(
            NotFoundResultsException()));

    var result = await searchByText("any_crazy_query");

    expect(result.fold(id, id), isA<NotFoundResultsException>());
  });
}
