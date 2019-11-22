import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ttd_clean_architecture/core/error/exceptions.dart';
import 'package:ttd_clean_architecture/core/error/failures.dart';
import 'package:ttd_clean_architecture/core/platfrom/network_info.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_dartasource.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_data_source.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/repositories/number_trivia_repositories_impl.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: "text trivia");
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test("should check if the device is online", () {
      /// arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      /// act
      repositoryImpl.getConcreteNumberTrivia(1);

      /// assert
      verify(mockNetworkInfo.isConnected);
    });


    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          "should return remote data when the call remote data source successful",
              () async {

            // arrange
            when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_)async=> tNumberTriviaModel);

            //act
                final result = await repositoryImpl.getConcreteNumberTrivia(tNumber);

                //assert
                verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
                expect(result, equals(Right(tNumberTrivia)));
          });

      test(
          "should cache data locally when the call remote data source successful",
              () async {

            // arrange
            when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_)async=> tNumberTriviaModel);

            //act
         await repositoryImpl.getConcreteNumberTrivia(tNumber);

            //assert
            verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
            verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));



          });


      test(
          "should return server failure when the call to remote data source in unsuccessful",
              () async {

            // arrange
            when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(ServerException());

            //act
            final result = await repositoryImpl.getConcreteNumberTrivia(tNumber);

            //assert
            verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
            verifyZeroInteractions(mockLocalDataSource);
            expect(result, equals(Left(ServerFailure())));

          });
    });



    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });


      test("should return locally cached data when is present", ()async{

      });
    });


  });



}
