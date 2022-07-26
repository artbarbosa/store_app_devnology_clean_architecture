abstract class IHttpService {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
