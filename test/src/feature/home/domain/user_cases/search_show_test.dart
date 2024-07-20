import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_maze_app/src/core/errors/failure.dart';
import 'package:tv_maze_app/src/feature/home/domain/entities/show_detail.dart';
import 'package:tv_maze_app/src/feature/home/domain/repositories/shows_repository.dart';
import 'package:tv_maze_app/src/feature/home/domain/user_cases/search_show.dart';
import 'package:tv_maze_app/src/feature/home/domain/user_cases/search_shows_use_case.dart';

class ShowsRepositoryMock extends Mock implements ShowsRepository {}

void main() {
  late ShowsRepository repository;
  late SearchShowUseCase sut;
  const query = 'pokemon';

  setUp(() {
    repository = ShowsRepositoryMock();
    sut = SearchShow(repository);
  });

  group(SearchShow, () { 
    test(
      'should return a show detail list when call return right',
      () async {
        // arrange
        const expectedEntity = ShowDetail(
          id: 09834, 
          name: 'show name', 
          url: 'http://url', 
          type: 'show type', 
          language: 'language', 
          summary: 'summary',
        );
        when(() => repository.getShowsByQuery(query: query))
          .thenAnswer((_) async => const Right([expectedEntity]));
        
        // act
        final result = await sut(query: query);
        
        // assert
        expect(result, const Right([expectedEntity]));        
      },
    );

    test(
      'should return a ServerFailure when repository fails',
      () async {
        // arrange
        when(() => repository.getShowsByQuery(query: query))
          .thenAnswer((_) async => const Left(ServerFailure()));
        
        // act
        final result = await sut(query: query);
        
        // assert
        expect(result, const Left(ServerFailure()));
      },
    );

    test('return network error state when user is offline', () async {
      // arrange
      when(() => repository.getShowsByQuery(query: query))
          .thenAnswer((_) async => const Left(NetworkFailure()));

      // act
      final result = await sut(query: query);

      // assert
      expect(result, const Left(NetworkFailure()));
    });

  });
}