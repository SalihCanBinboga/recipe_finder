import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RecipeRepository)
class RecipeRepositoryImpl extends RecipeRepository {
  RecipeRepositoryImpl({
    required super.remoteDataSource,
    required super.localFavoriteDataSource,
    required super.recipesCacheDatabase,
  });

  @override
  Future<void> addFavoriteRecipe(RecipeEntity recipe) async {
    await localFavoriteDataSource.saveRecipe(recipe.toJson());
  }

  @override
  Future<Iterable<RecipeEntity>> getFavoriteRecipes() async {
    final result = await localFavoriteDataSource.getFavoriteRecipes();

    return result.map(
      (recipe) => RecipeEntity.fromJson(recipe),
    );
  }

  @override
  Future<void> removeFavoriteRecipe(RecipeEntity recipe) {
    return localFavoriteDataSource.removeRecipe(recipe.id);
  }

  @override
  Future<Iterable<RecipeEntity>> searchRecipes({
    required String query,
  }) async {
    final result = await remoteDataSource.searchRecipes(
      query: query,
    );

    final recipeHits = result['hits'] as List<dynamic>;

    final recipes = recipeHits.map(
      (recipe) => RecipeEntity.fromJson(
        recipe['recipe'],
      ),
    );

    await recipesCacheDatabase.cacheRecipes(recipes);

    return recipes;
  }

  @override
  Future<Iterable<RecipeEntity>> getRecipes() async {
    return await recipesCacheDatabase.getRecipes();
  }
}
