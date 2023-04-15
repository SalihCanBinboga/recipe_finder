import 'package:flutter/material.dart';
import 'package:recipe_finder/app/core/base/base_view_model.dart';
import 'package:recipe_finder/app/domain/models/recipe_entity/recipe_entity.dart';
import 'package:recipe_finder/app/init/dependency_injection/dependency_injection.dart';
import 'package:recipe_finder/app/presentation/router/routes.dart';

import '../../../domain/usecases/search_recipes_use_case.dart';
import '../../router/route_manager.dart';

class HomeViewModel extends BaseViewModel {
  final List<RecipeEntity> recipes = [];

  void onRecipePressed({
    required final BuildContext context,
    required final RecipeEntity recipe,
  }) {
    RouteManager.navigateTo(
      context,
      Routes.recipeDetail,
      arguments: recipe,
    );
  }

  void onSearchTextChanged(String query) {
    final useCase = getIt<SearchRecipesUseCase>();

    useCase(
      query: query,
      onResult: (List<RecipeEntity> response) {
        recipes.clear();
        recipes.addAll(response);
        notifyListeners();
      },
    );
  }

  void onFavouriteRecipesPressed(BuildContext context) {
    RouteManager.navigateTo(
      context,
      Routes.favouriteRecipes,
    );
  }
}
