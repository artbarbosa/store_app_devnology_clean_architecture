import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app_devnology/app/core/product/domain/usecases/get_all_products_usecase.dart';
import 'package:store_app_devnology/app/modules/home/presentation/ui/controllers/home_controller.dart';
import 'package:store_app_devnology/app/modules/home/presentation/ui/states/product_states.dart';

import '../../../../../../mocks/mock.dart';

class IGetAllProductsUseCaseMock extends Mock
    implements IGetAllProductsUseCase {}

void main() {
  late HomeController controller;
  late IGetAllProductsUseCaseMock usecase;

  setUpAll(() {
    usecase = IGetAllProductsUseCaseMock();
    controller = HomeController(usecase);
  });

  group('HomeController - fetchProducts', () {
    test('Should get and change value ProductLoadedState', () async {
      when(() => usecase.call()).thenAnswer((_) async => listProductModelMock);

      await controller.fetchProducts();

      expect(controller.value, isA<ProductLoadedState>());
    });

    test('Should get and change value ProductErrorState', () async {
      when(() => usecase.call()).thenThrow(Exception());

      await controller.fetchProducts();

      expect(controller.value, isA<ProductErrorState>());
    });
  });
}
