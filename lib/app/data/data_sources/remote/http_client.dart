import 'package:dio/dio.dart';

// TODO: 2.04.2023 13:57 May create dependency injection for this class
class HttpClient {
  static final HttpClient _singleton = HttpClient._internal();

  factory HttpClient({required String baseUrl}) {
    final dio = _singleton._dio;
    dio.options.baseUrl = baseUrl;

    const appKey = String.fromEnvironment('app_key', defaultValue: '');
    const appId = String.fromEnvironment('app_id', defaultValue: '');

    dio.options.queryParameters.addAll({
      'app_key': appKey,
      'app_id': appId,
    });

    return _singleton;
  }

  final Dio _dio = Dio();

  Dio get _client => _dio;

  HttpClient._internal();

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
