import '../../../shared/failures/failures.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/errors/product_errors.dart';
import '../../domain/repositories/product_repository_interface.dart';
import '../adapters/json_to_product.dart';
import '../datasources/product_datasource_interface.dart';

class ProductRepository implements IProductRepository {
  final IProductDataSource datasource;

  ProductRepository({
    required this.datasource,
  });

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    try {
      final list = await datasource.getAllProducts('AllProducts');
      return list.map((e) => JsonToProduct.fromMap(e)).toList();
    } on NoInternetConnection catch (e) {
      rethrow;
    } catch (e, stackTrace) {
      throw ProductRepositoryError(
          label: e.toString(),
          exception: e,
          errorMessage: 'ProductRepositoryErro - getAllProducts',
          stackTrace: stackTrace);
    }
  }
}
