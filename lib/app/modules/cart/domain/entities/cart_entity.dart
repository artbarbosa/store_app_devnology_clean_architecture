import '../value_objects/item_in_cart.dart';

class CartEntity {
  List<ItemInCart> listProduct;

  CartEntity({
    required this.listProduct,
  });
}
