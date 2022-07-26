import 'package:flutter/foundation.dart';

import '../../../../../core/product/infra/model/product_model.dart';

class CartController {
  var listProduct = ValueNotifier<List<ProductModel>>([]);
}
