import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app_devnology/app/core/product/domain/entities/product_entity.dart';
import 'package:store_app_devnology/app/core/product/domain/usecases/get_all_products_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late IProductRepositoryMock repository;
  late GetAllProductsUseCase usecase;

  setUpAll(() {
    repository = IProductRepositoryMock();
    usecase = GetAllProductsUseCase(repository);
  });

  test('Should return List ProductEntity', () async {
    when(() => repository.getAllProducts())
        .thenAnswer((_) async => listProductEntityMock);

    final result = await usecase.call();

    expect(result, isA<List<ProductEntity>>());
    expect(result.first.uid, "01");
  });
}
