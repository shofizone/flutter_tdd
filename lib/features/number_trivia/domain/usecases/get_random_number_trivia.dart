
import 'package:dartz/dartz.dart';
import 'package:ttd_clean_architecture/core/error/failures.dart';
import 'package:ttd_clean_architecture/core/usecases/uscases.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/reposiotries/number_trivia_repository.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia,NoPrams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoPrams params) async {
    // TODO: implement call
    return await repository.getRandomNumberTrivia();
  }

}


