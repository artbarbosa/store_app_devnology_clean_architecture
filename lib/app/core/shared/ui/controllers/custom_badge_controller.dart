import 'package:flutter/cupertino.dart';

class CustomBadgeController {
  var numberItemsInCart = ValueNotifier<int>(0);

  setNumberItemsInCart(int value) {
    numberItemsInCart.value = value;
    numberItemsInCart.notifyListeners();
  }
}
