import '../entities/cart_entity.dart';

abstract class IDecrementItemInCartUseCase {
  CartEntity call(CartEntity cart, int index);
}

class DecrementItemInCartUseCase implements IDecrementItemInCartUseCase {
  @override
  CartEntity call(CartEntity cart, int index) {
    cart.listProduct[index].countProduct += 1;
    return cart;
  }
}
