import '../../../shared/failures/failures.dart';
import '../../../shared/services/remote/http_client_service_interface.dart';
import '../../domain/errors/product_errors.dart';
import '../../infra/datasources/product_datasource_interface.dart';

class ProductDataSource implements IProductDataSource {
  final IHttpService httpClient;
  ProductDataSource({
    required this.httpClient,
  });

  @override
  Future<List<Map>> getAllProducts(String path) async {
    try {
      final response = await httpClient.get(path);
      final list = response;
      return list as List<Map>;
    } on NoInternetConnection catch (e) {
      throw ProductDatasourceInternetConnection();
    } catch (e, stackTrace) {
      throw ProductDatasourceError(
          label: e.toString(),
          exception: e,
          errorMessage: 'ProductDataSourceError - getAllProducts',
          stackTrace: stackTrace);
    }
  }
}
