import 'package:flutter/material.dart';

import '../../../../../../../core/product/infra/model/product_model.dart';
import '../../../../../../../core/shared/ui/controllers/custom_badge_controller.dart';
import '../../../../../../cart/domain/usecases/add_item_in_cart_usecase.dart';
import '../../../../../../cart/presentation/ui/controllers/cart_controller.dart';

class DetailController {
  final CartController cartController;
  final IAddItemInCartUseCase addItemInCartUseCase;
  final CustomBadgeController badgeController;
  final PageController pageController = PageController();
  int activeImage = 0;

  DetailController({
    required this.cartController,
    required this.addItemInCartUseCase,
    required this.badgeController,
  });

  void addProductToCart(ProductModel product) {
    cartController.cart =
        addItemInCartUseCase.call(cartController.cart, product);
    cartController.calculatedTotal();
    badgeController
        .setNumberItemsInCart(cartController.cart.listProduct.length);
  }
}
