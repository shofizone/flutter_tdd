import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ttd_clean_architecture/core/error/failures.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/repositories/number_trivia_repository.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/usecases/GetConcreteNumberTrivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: tNumber, text: "test");

  test("should get trivia for the number from the repository", () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    // act
    final result = await usecase(Params(number: tNumber));

    // assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia((tNumber)));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });


}
