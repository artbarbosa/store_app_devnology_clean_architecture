import '../entities/cart_entity.dart';

abstract class IIcrementItemInCartUseCase {
  CartEntity call(CartEntity cart, int index);
}

class IcrementItemInCartUseCase implements IIcrementItemInCartUseCase {
  @override
  CartEntity call(CartEntity cart, int index) {
    cart.listProduct[index].countProduct += 1;
    return cart;
  }
}
