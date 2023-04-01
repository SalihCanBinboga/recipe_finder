import '../models/recipe_entity/recipe_entity.dart';

abstract class RecipeRepository {
  Future<Iterable<RecipeEntity>> getRecipes();

  Future<RecipeEntity> getRecipeDetails(String recipeId);

  Future<Iterable<RecipeEntity>> getFavoriteRecipes();

  Future<void> addFavoriteRecipe(RecipeEntity recipe);

  Future<void> removeFavoriteRecipe(RecipeEntity recipe);
}
