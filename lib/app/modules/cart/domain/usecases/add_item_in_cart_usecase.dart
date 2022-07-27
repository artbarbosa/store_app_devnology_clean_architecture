import '../../../../core/product/infra/model/product_model.dart';
import '../entities/cart_entity.dart';
import '../value_objects/item_in_cart.dart';

abstract class IAddItemInCartUseCase {
  CartEntity call(CartEntity cart, ProductModel product);
}

class AddItemInCartUseCase implements IAddItemInCartUseCase {
  @override
  CartEntity call(CartEntity cart, ProductModel product) {
    bool hasAdded = false;
    for (var i = 0; i < cart.listProduct.length; i++) {
      if (cart.listProduct[i].product.uid == product.uid) {
        hasAdded = true;
        cart.listProduct[i].countProduct += 1;
      }
    }
    if (hasAdded == false) {
      cart.listProduct.add(ItemInCart(product: product, countProduct: 1));
    }
    return cart;
  }
}
