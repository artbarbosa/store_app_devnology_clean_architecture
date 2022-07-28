import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/decrement_count_item_in_cart.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late DecrementItemInCartUseCase usecase;

  setUpAll(() {
    usecase = DecrementItemInCartUseCase();
  });

  test('Should decrement count item', () async {
    final result = usecase.call(cartEntityMock, 0);

    expect(result.listProduct.first.countProduct, 0);
  });
}
