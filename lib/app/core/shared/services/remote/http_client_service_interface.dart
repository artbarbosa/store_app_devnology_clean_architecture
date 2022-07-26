abstract class IHttpService {
  Future<dynamic> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
