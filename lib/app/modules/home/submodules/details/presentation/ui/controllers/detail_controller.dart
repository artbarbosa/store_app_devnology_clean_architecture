import 'package:flutter/material.dart';

import '../../../../../../../core/product/infra/model/product_model.dart';
import '../../../../../../cart/presentation/ui/controllers/cart_controller.dart';

class DetailController {
  final CartController cartController;
  final PageController pageController = PageController();
  int activeImage = 0;

  DetailController({
    required this.cartController,
  });

  void addProductToCart(ProductModel product) {
    bool hasAdded = false;
    for (var i = 0; i < cartController.listProduct.value.length; i++) {
      if (cartController.listProduct.value[i].uid == product.uid) {
        hasAdded = true;
        cartController.listCountProduct.value[i] += 1;
      }
    }
    if (hasAdded == false) {
      cartController.listProduct.value.add(product);
      cartController.listCountProduct.value.add(1);
    }
    cartController.calculatedTotal();
  }
}
