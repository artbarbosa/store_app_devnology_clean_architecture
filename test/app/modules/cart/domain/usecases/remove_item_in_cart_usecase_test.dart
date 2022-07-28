import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/remove_item_in_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late RemoveItemInCartUseCase usecase;

  setUpAll(() {
    usecase = RemoveItemInCartUseCase();
  });

  test('Should  remove item in cart', () async {
    final result = usecase.call(cartEntityMockSecondary, 0);

    expect(result.listProduct.isEmpty, true);
  });
  test('Should not remove item in cart', () async {
    final result = usecase.call(cartEntityMock, 0);

    expect(result.listProduct.isEmpty, false);
  });
}
