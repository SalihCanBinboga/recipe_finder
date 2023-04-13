import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class HttpClient {
  static final HttpClient _singleton = HttpClient._internal();

  factory HttpClient({required String baseUrl}) {
    final dio = _singleton._client;
    dio.options.baseUrl = baseUrl;

    for (final apiKey in ApiKeys.values) {
      dio.options.headers.addAll(
        {
          apiKey.name: apiKey.value,
        },
      );
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('REQUEST[${options.method}] => PATH: ${options.path}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('RESPONSE[${response.statusCode}] => '
                'PATH: ${response.requestOptions.path}');
          }
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          if (kDebugMode) {
            print('ERROR[${e.response?.statusCode}] => '
                'PATH: ${e.requestOptions.path}');
          }
          return handler.next(e);
        },
      ),
    );

    return _singleton;
  }

  final Dio _client = Dio();

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
