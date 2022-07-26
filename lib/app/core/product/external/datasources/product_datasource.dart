import '../../infra/datasources/product_datasource_interface.dart';

class ProductDataSource implements IProductDataSource {
  final IHttpService httpClient;

  @override
  Future<List<Map>> getAllProducts() async {
    final response = await httpClient.get();
    final list = response.data;
    return list as List<dynamic>;
  }
}
