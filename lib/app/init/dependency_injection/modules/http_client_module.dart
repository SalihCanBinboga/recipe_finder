import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/constants/api_keys.dart';

@module
abstract class HttpClientModule {
  @singleton
  @FactoryMethod(preResolve: true)
  Dio dio() {
    final dio = Dio();
    dio.options.baseUrl = ApiKeys.recipesBaseUrl.value;

    for (final apiKey in ApiKeys.values) {
      if (apiKey.isForHttpHeaders) {
        dio.options.queryParameters.addAll(
          {
            apiKey.apiKey: apiKey.value,
          },
        );
      }
    }

    dio.interceptors.add(_logger);

    return dio;
  }

  Interceptor get _logger {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print('REQUEST[${options.method}] => '
              'Endpoint: ${options.baseUrl}${options.path}');
          print('HEADERS: ${options.headers}');
          print('QUERY PARAMETERS: ${options.queryParameters}');
          print('DATA: ${options.data}');
          print('All Url with Query Parameters: ${options.uri}');

          print('----------------------------------------');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print('RESPONSE[${response.statusCode}] => '
              'PATH: ${response.requestOptions.path}');
          print('HEADERS: ${response.headers}');
          print('DATA: ${response.data}');
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
    );
  }
}
