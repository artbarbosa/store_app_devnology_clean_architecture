import '../entities/cart_entity.dart';

abstract class IRemoveItemInCartUseCase {
  CartEntity call(CartEntity cart, int index);
}

class RemoveItemInCartUseCase implements IRemoveItemInCartUseCase {
  @override
  CartEntity call(CartEntity cart, int index) {
    if (cart.listProduct[index].countProduct == 0) {
      cart.listProduct.remove(cart.listProduct[index]);
    }
    return cart;
  }
}
