import 'package:store_app_devnology/app/core/product/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAllProducts();
}
