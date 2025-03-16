import 'dart:convert';

enum HttpMethod { get, post, put, delete }

abstract class HttpClient {
  Future<HttpResponse> request(
    HttpMethod method, {
    required String path,
    Map<String, String>? headers,
    dynamic body,
  });
}

class HttpResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, String>? headers;

  HttpResponse({this.data, this.statusCode, this.statusMessage, this.headers});

  @override
  String toString() {
    final responseMap = {
      "statusCode": statusCode,
      "statusMessage": statusMessage,
      "headers": headers,
      "data": data is Map || data is List ? json.encode(data) : data.toString(),
    };
    return json.encode(responseMap);
  }
}
