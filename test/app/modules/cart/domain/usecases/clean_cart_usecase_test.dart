import 'package:flutter_test/flutter_test.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/clean_cart_usecase.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late CleanCartUseCase usecase;

  setUpAll(() {
    usecase = CleanCartUseCase();
  });

  test('Should return cart clean', () async {
    final result = usecase.call(cartEntityMock);

    expect(result.listProduct.isEmpty, true);
  });
}
