
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRemoteDataSource{

  ///Call the http://numbersapi.com/{number} endpoint
  ///
  /// Throw a [ServerException] for all error codes.

  @override
  Future< NumberTrivia> getConcreteNumberTrivia(int number);


  ///Call the http://numbersapi.com/random endpoint
  ///
  /// Throw a [ServerException] for all error codes.

  @override
  Future< NumberTrivia> getRandomNumberTrivia();
}