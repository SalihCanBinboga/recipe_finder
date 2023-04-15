import 'package:flutter/material.dart' show BuildContext;
import 'package:injectable/injectable.dart';
import 'package:recipe_finder/app/core/base/base_view_model.dart';
import 'package:recipe_finder/app/domain/models/recipe_entity/recipe_entity.dart';
import 'package:recipe_finder/app/presentation/router/routes.dart';

import '../../../domain/usecases/get_favorite_recipes_use_case.dart';
import '../../router/route_manager.dart';

@injectable
class FavouriteRecipesViewModel extends BaseViewModel {
  final GetFavoriteRecipesUseCase getFavoriteRecipesUseCase;

  FavouriteRecipesViewModel(this.getFavoriteRecipesUseCase);

  final List<RecipeEntity> favoriteRecipes = [];

  @override
  void initViewModel() {
    _getFavoriteRecipes();
  }

  Future<void> _getFavoriteRecipes() async {
    final favoriteRecipeUseCase = await getFavoriteRecipesUseCase();
    favoriteRecipes.clear();
    favoriteRecipes.addAll(favoriteRecipeUseCase);
    notifyListeners();
  }

  Future<void> onRecipePressed(RecipeEntity recipe, BuildContext context) async {
    await RouteManager.navigateTo(
      context,
      Routes.recipeDetail,
      arguments: recipe,
    );
    _getFavoriteRecipes();
  }
}
