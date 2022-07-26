import 'package:store_app_devnology/app/core/product/domain/entities/product_entity.dart';
import 'package:store_app_devnology/app/core/product/infra/datasources/product_datasource_interface.dart';

import '../../domain/repositories/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  final IProductDataSource datasource;
  ProductRepository({
    required this.datasource,
  });

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final result = await datasource.getAllProducts();
  }
}