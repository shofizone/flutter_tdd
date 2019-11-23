import 'package:dartz/dartz.dart';
import 'package:ttd_clean_architecture/core/error/exceptions.dart';
import 'package:ttd_clean_architecture/core/error/failures.dart';
import 'package:ttd_clean_architecture/core/network/network_info.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_dartasource.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_data_source.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/reposiotries/number_trivia_repository.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

typedef Future<NumberTrivia> _ConcreteOrRandamChooser();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {this.remoteDataSource, this.localDataSource, this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _ConcreteOrRandamChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        var result = await localDataSource.getLastNumberTrivia();
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
