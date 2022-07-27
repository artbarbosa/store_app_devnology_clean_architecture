import 'package:flutter/foundation.dart';

import '../../../../../core/product/infra/model/product_model.dart';

class CartController extends ChangeNotifier {
  List<ProductModel> listProduct = [];
  List<int> listCountProduct = [];
  double totalValue = 0;

  void calculatedTotal() {
    totalValue = 0;
    for (var i = 0; i < listProduct.length; i++) {
      totalValue += (listProduct[i].price * listCountProduct[i]);
    }
    notifyListeners();
  }

  void decrementCount(int index) {
    listCountProduct[index] -= 1;
    calculatedTotal();
    notifyListeners();
  }

  void incrementCount(int index) {
    listCountProduct[index] += 1;
    calculatedTotal();
    notifyListeners();
  }
}
