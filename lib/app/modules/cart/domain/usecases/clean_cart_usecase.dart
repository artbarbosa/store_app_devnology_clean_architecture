import '../entities/cart_entity.dart';

abstract class ICleanCartUseCase {
  CartEntity call(
    CartEntity cart,
  );
}

class CleanCartUseCase implements ICleanCartUseCase {
  @override
  CartEntity call(CartEntity cart) {
    cart.listProduct.clear();
    return cart;
  }
}
