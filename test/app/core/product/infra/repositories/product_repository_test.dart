import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app_devnology/app/core/product/domain/entities/product_entity.dart';
import 'package:store_app_devnology/app/core/product/domain/errors/product_errors.dart';
import 'package:store_app_devnology/app/core/product/infra/repositories/product_repository.dart';
import 'package:store_app_devnology/app/core/shared/failures/failures.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late IProductDataSourceMock datasoucer;
  late ProductRepository repository;

  setUpAll(() {
    datasoucer = IProductDataSourceMock();
    repository = ProductRepository(datasource: datasoucer);
  });

  group('Product Repository - getAllProducts', () {
    test('Should return List ProductEntity', () async {
      when(() => datasoucer.getAllProducts('AllProducts'))
          .thenAnswer((_) async => listProductTestMock);

      final result = await repository.getAllProducts();

      expect(result, isA<List<ProductEntity>>());
      expect(result.length, 3);
    });

    test('Should Throw NoInternetConnection', () async {
      when(() => datasoucer.getAllProducts('AllProducts'))
          .thenThrow(NoInternetConnection());

      expect(() async => await repository.getAllProducts(),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should Throw ProductRepositoryError', () async {
      when(() => datasoucer.getAllProducts('AllProducts'))
          .thenThrow(Exception());

      expect(() async => await repository.getAllProducts(),
          throwsA(isA<ProductRepositoryError>()));
    });
  });
}
