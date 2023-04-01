abstract class RemoteRecipeDataSource {
  Future<Map<String, dynamic>> getRecipe({
    required String recipeId,
  });

  Future<List<Map<String, dynamic>>> getRecipes();
}
