import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/core/product/domain/entities/product_entity.dart';
import 'package:store_app_devnology/app/core/product/infra/adapters/json_to_product.dart';
import 'package:store_app_devnology/app/core/product/infra/model/product_model.dart';

import '../../../../../mocks/mock.dart';

void main() {
  test('Shold convert Map to ProductEntity', () {
    final product = JsonToProduct.fromMap(productMapMock);

    expect(product, isA<ProductModel>());
    expect(product, isA<ProductEntity>());
    expect(product.uid, '01');
  });
}
