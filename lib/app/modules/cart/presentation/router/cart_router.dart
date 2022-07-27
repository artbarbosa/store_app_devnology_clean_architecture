import 'package:flutter/material.dart';

import '../../submodules/checkout/presentation/routers/order_router.dart';
import '../ui/container/cart_container_page.dart';

class CartRouter extends StatelessWidget {
  const CartRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/cart',
      onGenerateRoute: (settings) {
        if (settings.name == '/cart') {
          return MaterialPageRoute(
            builder: (context) {
              return CartContainerPage();
            },
          );
        }
        if (settings.name == '/order') {
          return MaterialPageRoute(
            builder: (context) {
              return const OrderRouter();
            },
          );
        }
        return null;
      },
    );
  }
}
