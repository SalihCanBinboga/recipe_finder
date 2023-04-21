import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class HttpClient {
  final Dio _client;

  HttpClient(this._client);

  Future<Response> get({
    String path = '',
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _client.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
