abstract class IProductDataSource {
  Future<List<Map>> getAllProducts(String path);
}
