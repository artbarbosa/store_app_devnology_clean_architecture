import '../../../../core/product/infra/model/product_model.dart';

class ItemInCart {
  final ProductModel product;
  int countProduct;

  ItemInCart({
    required this.product,
    required this.countProduct,
  });
}
