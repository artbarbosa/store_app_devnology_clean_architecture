import '../../../shared/services/remote/http_client_service_interface.dart';
import '../../infra/datasources/product_datasource_interface.dart';

class ProductDataSource implements IProductDataSource {
  final IHttpService httpClient;
  ProductDataSource({
    required this.httpClient,
  });

  @override
  Future<List<Map>> getAllProducts(String path) async {
    final response = await httpClient.get(path);
    final list = response;
    return list as List<Map>;
  }
}
