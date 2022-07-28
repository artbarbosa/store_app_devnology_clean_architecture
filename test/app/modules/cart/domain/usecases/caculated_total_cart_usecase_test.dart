import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/caculated_total_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late CalculatedTotalCartUseCase usecase;

  setUpAll(() {
    usecase = CalculatedTotalCartUseCase();
  });

  test('Should return total value in cart', () async {
    final result = usecase.call(cartEntityMock);

    expect(result, 200.0);
  });
}
