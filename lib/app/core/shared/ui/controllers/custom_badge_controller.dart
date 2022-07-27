import 'package:flutter/cupertino.dart';

class CustomBadgeController {
  var numberItemsInCart = ValueNotifier(3);

  setNumberItemsInCart(int value) {
    numberItemsInCart.value = value;
  }
}
