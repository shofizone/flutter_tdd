import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:ttd_clean_architecture/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfompl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfompl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group("isConnected", () {
    test("should forward the call to DataConnectionChekcer.hasConnection",
        () async {
      //arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_)  => tHasConnectionFuture);

      //act
      final result = networkInfompl.isConnected;

      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
