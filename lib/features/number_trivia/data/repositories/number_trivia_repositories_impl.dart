
import 'package:dartz/dartz.dart';
import 'package:ttd_clean_architecture/core/error/failures.dart';
import 'package:ttd_clean_architecture/core/platfrom/network_info.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_dartasource.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_data_source.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/reposiotries/number_trivia_repository.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;


  NumberTriviaRepositoryImpl({this.remoteDataSource, this.localDataSource,
    this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {

    return null;
  }
}