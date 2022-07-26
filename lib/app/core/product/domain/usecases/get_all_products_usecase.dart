import '../entities/product_entity.dart';
import '../repositories/product_repository_interface.dart';

abstract class IGetAllProductsUseCase {
  Future<List<ProductEntity>> call();
}

class GetAllProductsUseCase implements IGetAllProductsUseCase {
  final IProductRepository _repository;
  GetAllProductsUseCase(this._repository);
  @override
  Future<List<ProductEntity>> call() async {
    return await _repository.getAllProducts();
  }
}
