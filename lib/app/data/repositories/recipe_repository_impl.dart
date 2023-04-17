import 'package:injectable/injectable.dart';

import '../../domain/models/recipe_entity/recipe_entity.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../data_sources/local/local_recipe_favorite_data_source.dart';
import '../data_sources/local/recipes_cache_database.dart';
import '../data_sources/models/recipe_response.dart';
import '../data_sources/remote/remote_recipe_data_source.dart';

@LazySingleton(as: RecipeRepository)
class RecipeRepositoryImpl implements RecipeRepository {
  final RemoteRecipeDataSource _remoteDataSource;
  final LocalRecipeFavoriteDataSource _localFavoriteDataSource;
  final RecipesCacheDatabase _recipesCacheDatabase;

  RecipeRepositoryImpl(
    this._remoteDataSource,
    this._localFavoriteDataSource,
    this._recipesCacheDatabase,
  );

  @override
  Future<void> addFavoriteRecipe(RecipeEntity recipe) async {
    await _localFavoriteDataSource.saveRecipe(recipe.toJson());
  }

  @override
  Future<Iterable<RecipeEntity>> getFavoriteRecipes() async {
    final result = await _localFavoriteDataSource.getFavoriteRecipes();

    return result.map(
      (recipe) => RecipeEntity.fromJson(recipe),
    );
  }

  @override
  Future<void> removeFavoriteRecipe(RecipeEntity recipe) {
    return _localFavoriteDataSource.removeRecipe(recipe.id);
  }

  @override
  Future<Iterable<RecipeEntity>> searchRecipes({
    required String query,
  }) async {
    final result = await _remoteDataSource.searchRecipes(
      query: query,
    );

    final recipeHits = result['hits'] as List<dynamic>;

    final recipes = recipeHits.map(
      (recipe) => RecipeResponse.fromJson(
        recipe['recipe'],
      ),
    );

    await _recipesCacheDatabase.cacheRecipes(recipes);

    return recipes.map(
      (recipe) => RecipeEntity.fromRecipeResponse(recipe),
    );
  }

  @override
  Future<Iterable<RecipeEntity>> getRecipes() async {
    final result = await _recipesCacheDatabase.getRecipes();

    return result.map(
      (recipe) => RecipeEntity.fromRecipeResponse(recipe),
    );
  }
}
