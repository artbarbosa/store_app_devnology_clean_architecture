import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/incremet_count_item_in_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late IcrementItemInCartUseCase usecase;

  setUpAll(() {
    usecase = IcrementItemInCartUseCase();
  });

  test('Should increment count item', () async {
    final result = usecase.call(cartEntityMock, 0);

    expect(result.listProduct.first.countProduct, 2);
  });
}
