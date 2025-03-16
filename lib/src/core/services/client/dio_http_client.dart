import 'package:colibreria/src/core/services/client/http_client.dart';
import 'package:dio/dio.dart';

class DioHttpClient implements HttpClient {
  final Dio dio;

  DioHttpClient({required this.dio});

  @override
  Future<HttpResponse> request(
    HttpMethod method, {
    required String path,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await dio.request(
        path,
        data: body,
        options: Options(method: method.name, headers: headers),
      );
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers.map.map(
          (key, value) => MapEntry(key, value.first),
        ),
      );
    } on DioException {
      rethrow;
    }
  }
}
