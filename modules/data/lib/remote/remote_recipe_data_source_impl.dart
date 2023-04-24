import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote/http_client.dart';

@LazySingleton(as: RemoteRecipeDataSource)
class RemoteRecipeDataSourceImpl extends RemoteRecipeDataSource {
  final HttpClient _httpClient;

  RemoteRecipeDataSourceImpl(this._httpClient);

  @override
  Future<Map<String, dynamic>> searchRecipes({
    required String query,
  }) async {
    final response = await _httpClient.get(
      queryParameters: {
        'q': query,
        'type': 'public',
      },
    );

    final data = response.data;

    if (data == null) {
      // TODO: 13.04.2023 13:21 May create a custom exception
      return {};
    }

    return data;
  }
}
