import '../../mock_data/mock_data.dart';
import 'http_client_service_interface.dart';

class HttpClienteMock implements IHttpService {
  @override
  Future<dynamic> get(Object path,
      {Map<String, dynamic>? queryParameters}) async {
    if (path == 'AllProducts') {
      return listProductMock;
    }
    return [];
  }
}
