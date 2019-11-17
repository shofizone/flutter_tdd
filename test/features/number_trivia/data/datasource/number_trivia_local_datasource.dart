import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ttd_clean_architecture/core/platfrom/network_info.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_dartasource.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_data_source.dart';
import 'package:ttd_clean_architecture/features/number_trivia/data/repositories/number_trivia_repositories_impl.dart';
import 'package:ttd_clean_architecture/features/number_trivia/domain/reposiotries/number_trivia_repository.dart';

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
}
