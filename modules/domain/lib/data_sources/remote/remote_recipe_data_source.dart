abstract class RemoteRecipeDataSource {
  Future<Map<String, dynamic>> searchRecipes({
    required String query,
  });
}
