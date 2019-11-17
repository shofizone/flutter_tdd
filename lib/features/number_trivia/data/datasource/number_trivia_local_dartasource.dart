import 'package:ttd_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{

  ///Get the cached [NumberTriviaModel] which was gotten the last time
  ///the user had a internet connection.
  ///
  /// Throw a [CacheException] if no data present

  Future<NumberTriviaModel> getLastNumberTrivia();


  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}