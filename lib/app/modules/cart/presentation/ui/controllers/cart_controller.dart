import 'package:flutter/foundation.dart';

import '../../../../../core/product/infra/model/product_model.dart';

class CartController {
  var listProduct = ValueNotifier<List<ProductModel>>([]);
  var listCountProduct = ValueNotifier<List<int>>([]);
  var totalValue = ValueNotifier<double>(0);

  calculatedTotal() {
    totalValue.value = 0;
    for (var i = 0; i < listProduct.value.length; i++) {
      totalValue.value +=
          (listProduct.value[i].price * listCountProduct.value[i]);
    }
    totalValue.notifyListeners();
  }

  decrementCount(int index) {
    listCountProduct.value[index] -= 1;
    calculatedTotal();
    listCountProduct.notifyListeners();
  }

  incrementCount(int index) {
    listCountProduct.value[index] += 1;
    calculatedTotal();
    listCountProduct.notifyListeners();
  }
}
