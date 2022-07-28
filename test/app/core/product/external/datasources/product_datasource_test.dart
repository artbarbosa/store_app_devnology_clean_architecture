import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app_devnology/app/core/product/domain/errors/product_errors.dart';
import 'package:store_app_devnology/app/core/product/external/datasources/product_datasource.dart';
import 'package:store_app_devnology/app/core/shared/failures/failures.dart';
import 'package:store_app_devnology/app/core/shared/services/remote/http_client_service_interface.dart';

import '../../../../../mocks/mock.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late HttpServiceMock httpClient;
  late ProductDataSource datasource;

  setUpAll(() {
    httpClient = HttpServiceMock();
    datasource = ProductDataSource(httpClient: httpClient);
  });

  group('ProductDataSourceImp - getAllProducts', () {
    test('Should return List<Map>', () async {
      when(() => httpClient.get(any()))
          .thenAnswer((_) async => listProductTestMock);

      final result = await datasource.getAllProducts('AllProducts');

      expect(result, isA<List<Map>>());
      expect(result.first['uid'], '01');
    });

    test('Should Throw NoInternetConnection', () async {
      when(() => httpClient.get('AllProducts'))
          .thenThrow(NoInternetConnection());

      expect(() async => await datasource.getAllProducts('AllProducts'),
          throwsA(isA<ProductDatasourceInternetConnection>()));
    });

    test('Should Throw ProductRepositoryError', () async {
      when(() => httpClient.get('AllProducts')).thenThrow(Exception());

      expect(() async => await datasource.getAllProducts('AllProducts'),
          throwsA(isA<ProductDatasourceError>()));
    });
  });
}
