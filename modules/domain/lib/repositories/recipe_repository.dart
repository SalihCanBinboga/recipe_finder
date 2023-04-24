import '../domain.dart';

abstract class RecipeRepository {
  final RemoteRecipeDataSource remoteDataSource;
  final LocalRecipeFavoriteDataSource localFavoriteDataSource;
  final RecipesCacheDatabase recipesCacheDatabase;

  const RecipeRepository({
    required this.remoteDataSource,
    required this.localFavoriteDataSource,
    required this.recipesCacheDatabase,
  });

  Future<Iterable<RecipeEntity>> searchRecipes({
    required String query,
  });

  Future<Iterable<RecipeEntity>> getFavoriteRecipes();

  Future<void> addFavoriteRecipe(RecipeEntity recipe);

  Future<void> removeFavoriteRecipe(RecipeEntity recipe);

  Future<Iterable<RecipeEntity>> getRecipes();
}
