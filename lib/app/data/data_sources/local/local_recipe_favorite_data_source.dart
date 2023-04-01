abstract class LocalRecipeFavoriteDataSource {
  Future<void> saveRecipe(Map<String, dynamic> recipe);

  Future<List<Map<String, dynamic>>> getFavoriteRecipes();

  Future<void> removeRecipe(String recipeId);
}
