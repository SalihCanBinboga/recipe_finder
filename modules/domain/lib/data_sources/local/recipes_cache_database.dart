import '../../models/recipe_entity/recipe_entity.dart';

abstract class RecipesCacheDatabase {
  Future<Iterable<RecipeEntity>> getRecipes();

  Future<void> cacheRecipes(Iterable<RecipeEntity> recipes);

  Future<void> clearCache();
}
