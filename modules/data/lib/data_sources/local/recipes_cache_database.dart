import '../models/recipe_response.dart';

abstract class RecipesCacheDatabase {
  Future<Iterable<RecipeResponse>> getRecipes();

  Future<void> cacheRecipes(Iterable<RecipeResponse> recipes);

  Future<void> clearCache();
}
