import 'package:flutter/foundation.dart';
import 'package:store_app_devnology/app/modules/cart/domain/usecases/decrement_count_item_in_cart.dart';

import '../../../../../core/product/infra/model/product_model.dart';
import '../../../../../core/shared/ui/controllers/custom_badge_controller.dart';
import '../../../domain/entities/cart_entity.dart';
import '../../../domain/usecases/caculated_total_cart_usecase.dart';
import '../../../domain/usecases/clean_cart_usecase.dart';
import '../../../domain/usecases/incremet_count_item_in_cart_usecase.dart';
import '../../../domain/usecases/remove_item_in_cart_usecase.dart';

class CartController extends ChangeNotifier {
  final ICalculatedTotalCartUseCase calculatedTotalCartUseCase;
  final IIcrementItemInCartUseCase icrementItemInCartUseCase;
  final IDecrementItemInCartUseCase decrementItemInCartUseCase;
  final IRemoveItemInCartUseCase removeItemInCartUseCase;
  final CustomBadgeController badgeController;
  final ICleanCartUseCase cleanCartUseCase;
  CartController({
    required this.badgeController,
    required this.calculatedTotalCartUseCase,
    required this.icrementItemInCartUseCase,
    required this.decrementItemInCartUseCase,
    required this.removeItemInCartUseCase,
    required this.cleanCartUseCase,
  });
  var cart = CartEntity(listProduct: []);
  List<ProductModel> listProduct = [];
  List<int> listCountProduct = [];
  double totalValue = 0;

  void calculatedTotal() {
    totalValue = calculatedTotalCartUseCase.call(cart);
    notifyListeners();
  }

  void decrementCount(int index) {
    cart = decrementItemInCartUseCase.call(cart, index);
    removeItem(index);
    totalValue = calculatedTotalCartUseCase.call(cart);
    badgeController.setNumberItemsInCart(cart.listProduct.length);
    notifyListeners();
  }

  void incrementCount(int index) {
    cart = icrementItemInCartUseCase.call(cart, index);
    totalValue = calculatedTotalCartUseCase.call(cart);
    notifyListeners();
  }

  removeItem(int index) {
    cart = removeItemInCartUseCase.call(cart, index);
    notifyListeners();
  }

  void checkoutCart() {
    cart = cleanCartUseCase.call(cart);
    totalValue = calculatedTotalCartUseCase.call(cart);
    notifyListeners();
  }
}
