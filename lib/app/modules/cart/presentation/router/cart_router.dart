import 'package:flutter/material.dart';

import '../ui/container/cart_container_page.dart';

class CartRouter extends StatelessWidget {
  const CartRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartContainerPage();
  }
}
