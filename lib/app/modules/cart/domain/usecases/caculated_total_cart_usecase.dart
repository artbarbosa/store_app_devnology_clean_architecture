import '../entities/cart_entity.dart';

abstract class ICalculatedTotalCartUseCase {
  double call(CartEntity cart);
}

class CalculatedTotalCartUseCase implements ICalculatedTotalCartUseCase {
  @override
  double call(CartEntity cart) {
    double totalValue = 0;
    for (var i = 0; i < cart.listProduct.length; i++) {
      totalValue += (cart.listProduct[i].product.price *
          cart.listProduct[i].countProduct);
    }
    return totalValue;
  }
}
