import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/add_item_in_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late AddItemInCartUseCase usecase;

  setUpAll(() {
    usecase = AddItemInCartUseCase();
  });

  test('Should add item in cart', () async {
    final result = usecase.call(cartEntityMock, productModelMockSecondary);

    expect(result.listProduct.length, 2);
  });
  test('Should count item in cart', () async {
    final result = usecase.call(cartEntityMock, productModelMock);

    expect(result.listProduct.first.countProduct, 2);
  });
}
