import 'package:anime_dart/app/core/search/domain/errors/exceptions.dart';
import 'package:anime_dart/app/core/search/infra/data_sources/search_data_source.dart';
import 'package:anime_dart/app/core/search/infra/models/anime_model.dart';
import 'package:anime_dart/app/core/search/infra/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource {}

void main() {
  final dataSource = SearchDataSourceMock();
  final repository = SearchRepositoryImplementation(dataSource);

  group("test searchByText() method", () {
    test("should return a AnimeModel list", () async {
      when(dataSource.searchByText(any))
          .thenAnswer((_) async => [AnimeModel()]);

      final result = await repository.searchByText("akame ga kill");

      expect(result.fold(id, id), isA<List<AnimeModel>>());
    });

    test("should return a NotFoundResultsException list", () async {
      when(dataSource.searchByText(any)).thenAnswer((_) async => []);

      final result = await repository.searchByText("any_crazy_query");

      expect(result.fold(id, id), isA<NotFoundResultsException>());
    });
  });
}
