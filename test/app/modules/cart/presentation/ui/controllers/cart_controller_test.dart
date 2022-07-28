import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store_app_devnology/app/core/shared/ui/controllers/custom_badge_controller.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/caculated_total_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/clean_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/decrement_count_item_in_cart.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/incremet_count_item_in_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/remove_item_in_cart_usecase.dart';
import 'package:store_app_devnology/app/modules/cart/presentation/ui/controllers/cart_controller.dart';

class ICalculatedTotalCartUseCaseMock extends Mock
    implements ICalculatedTotalCartUseCase {}

class IIcrementItemInCartUseCaseMock extends Mock
    implements IIcrementItemInCartUseCase {}

class IDecrementItemInCartUseCaseMock extends Mock
    implements IDecrementItemInCartUseCase {}

class ICleanCartUseCaseMock extends Mock implements ICleanCartUseCase {}

class IRemoveItemInCartUseCaseMock extends Mock
    implements IRemoveItemInCartUseCase {}

class CustomBadgeControllerMock extends Mock implements CustomBadgeController {}

void main() {
  late CartController controller;
  late ICalculatedTotalCartUseCaseMock calculatedTotalCartUseCase;
  late IIcrementItemInCartUseCaseMock icrementItemInCartUseCase;
  late IDecrementItemInCartUseCaseMock decrementItemInCartUseCase;
  late ICleanCartUseCaseMock cleanCartUseCaseMock;
  late IRemoveItemInCartUseCase removeItemInCartUseCase;
  late CustomBadgeControllerMock customBadgeController;

  setUpAll(() {
    calculatedTotalCartUseCase = ICalculatedTotalCartUseCaseMock();
    icrementItemInCartUseCase = IIcrementItemInCartUseCaseMock();
    decrementItemInCartUseCase = IDecrementItemInCartUseCaseMock();
    cleanCartUseCaseMock = ICleanCartUseCaseMock();
    removeItemInCartUseCase = IRemoveItemInCartUseCaseMock();
    customBadgeController = CustomBadgeControllerMock();
    controller = CartController(
      calculatedTotalCartUseCase: calculatedTotalCartUseCase,
      icrementItemInCartUseCase: icrementItemInCartUseCase,
      decrementItemInCartUseCase: decrementItemInCartUseCase,
      cleanCartUseCase: cleanCartUseCaseMock,
      removeItemInCartUseCase: removeItemInCartUseCase,
      badgeController: customBadgeController,
    );
  });

  group('CartController - calculatedTotal', () {
    test('Should calculated Total', () {
      when(() => calculatedTotalCartUseCase.call(controller.cart))
          .thenAnswer((_) => 200.0);

      controller.calculatedTotal();

      expect(controller.totalValue, 200.0);
    });
  });
}
