import 'package:store_app_devnology/app/core/product/infra/repositories/product_repository.dart';

import '../entities/product_entity.dart';

abstract class IGetAllProductsUseCase {
  Future<List<ProductEntity>> call();
}

class GetAllProductsUseCase implements IGetAllProductsUseCase {
  final ProductRepository _repository;
  GetAllProductsUseCase(this._repository);
  @override
  Future<List<ProductEntity>> call() async {
    return await _repository.getAllProducts();
  }
}
