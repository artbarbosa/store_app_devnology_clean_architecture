import 'package:flutter/material.dart';

import '../../../../../../../core/product/infra/model/product_model.dart';
import '../../../../../../cart/domain/usecases/add_item_in_cart_usecase.dart';
import '../../../../../../cart/presentation/ui/controllers/cart_controller.dart';

class DetailController {
  final CartController cartController;
  final IAddItemInCartUseCase addItemInCartUseCase;
  final PageController pageController = PageController();
  int activeImage = 0;

  DetailController({
    required this.addItemInCartUseCase,
    required this.cartController,
  });

  void addProductToCart(ProductModel product) {
    cartController.cart =
        addItemInCartUseCase.call(cartController.cart, product);
    cartController.calculatedTotal();
  }
}
