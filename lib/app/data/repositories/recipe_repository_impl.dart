import 'package:injectable/injectable.dart';

import '../../domain/models/recipe_entity/recipe_entity.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../data_sources/local/local_recipe_favorite_data_source.dart';
import '../data_sources/models/recipe_response.dart';
import '../data_sources/remote/remote_recipe_data_source.dart';

@LazySingleton(
  as: RecipeRepository,
)
class RecipeRepositoryImpl implements RecipeRepository {
  final RemoteRecipeDataSource _remoteDataSource;
  final LocalRecipeFavoriteDataSource _localFavoriteDataSource;

  RecipeRepositoryImpl(this._remoteDataSource, this._localFavoriteDataSource);

  @override
  Future<void> addFavoriteRecipe(RecipeEntity recipe) async {
    await _localFavoriteDataSource.saveRecipe(recipe.toJson());
  }

  @override
  Future<Iterable<RecipeEntity>> getFavoriteRecipes() async {
    final result = await _localFavoriteDataSource.getFavoriteRecipes();

    final recipes = result.map((recipe) => RecipeResponse.fromJson(recipe));

    return recipes.map(
      (recipe) => RecipeEntity.fromRecipeResponse(recipe),
    );
  }

  @override
  Future<RecipeEntity> getRecipeDetails(String recipeId) async {
    final result = await _remoteDataSource.getRecipe(recipeId: recipeId);
    final recipe = RecipeResponse.fromJson(result);
    return RecipeEntity.fromRecipeResponse(recipe);
  }

  @override
  Future<void> removeFavoriteRecipe(RecipeEntity recipe) {
    return _localFavoriteDataSource.removeRecipe(recipe.id);
  }

  @override
  Future<Iterable<RecipeEntity>> searchRecipes({
    required String query,
  }) async {
    // TODO: 1.04.2023 21:56 May create a cache for this data.

    final result = await _remoteDataSource.searchRecipes(
      query: query,
    );

    final recipeHits = result['hits'] as List<dynamic>;

    final recipes = recipeHits.map((recipe) => RecipeResponse.fromJson(recipe));

    return recipes.map(
      (recipe) => RecipeEntity.fromRecipeResponse(recipe),
    );
  }
}
