import '../entities/product_entity.dart';
import '../repositories/product_repository_interface.dart';

abstract class ISimulateCreditUseCase {
  Future<List<ProductEntity>> call();
}

class SimulateCreditUseCase implements ISimulateCreditUseCase {
  final IProductRepository _repository;
  SimulateCreditUseCase(this._repository);
  @override
  Future<List<ProductEntity>> call() async {
    return await _repository.getAllProducts();
  }
}
