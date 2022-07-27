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
    for (var i = 0; i < cartController.listProduct.length; i++) {
      if (cartController.listProduct[i].uid == product.uid) {
        hasAdded = true;
        cartController.listCountProduct[i] += 1;
      }
    }
    if (hasAdded == false) {
      cartController.listProduct.add(product);
      cartController.listCountProduct.add(1);
    }
    cartController.calculatedTotal();
  }
}
