abstract class RemoteRecipeDataSource {
  Future<Map<String, dynamic>> getRecipe({
    required String recipeId,
  });

  Future<Map<String, dynamic>> searchRecipes({
    required String query,
  });
}
