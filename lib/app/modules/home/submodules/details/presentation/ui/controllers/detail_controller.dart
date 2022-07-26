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
    cartController.listProduct.value.add(product);
  }
}
