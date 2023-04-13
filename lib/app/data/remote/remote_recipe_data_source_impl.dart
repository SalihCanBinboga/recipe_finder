import 'package:injectable/injectable.dart';
import 'package:recipe_finder/app/data/data_sources/remote/http_client.dart';

import '../data_sources/remote/remote_recipe_data_source.dart';

@LazySingleton(as: RemoteRecipeDataSource)
class RemoteRecipeDataSourceImpl extends RemoteRecipeDataSource {
  final HttpClient _httpClient;

  RemoteRecipeDataSourceImpl(this._httpClient);

  @override
  Future<Map<String, dynamic>> getRecipe({required String recipeId}) async {
    final response = await _httpClient.get(path: '/$recipeId');
    return response.data;
  }

  @override
  Future<List<Map<String, dynamic>>> getRecipes() async {
    final response = await _httpClient.get();
    return response.data;
  }
}
