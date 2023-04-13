import 'package:flutter/material.dart';
import 'package:recipe_finder/app/core/base/base_view_model.dart';
import 'package:recipe_finder/app/domain/models/recipe_entity/recipe_entity.dart';
import 'package:recipe_finder/app/init/dependency_injection/dependency_injection.dart';
import 'package:recipe_finder/app/presentation/screens/recipe_detail/recipe_detail_view.dart';

import '../../../domain/usecases/search_recipes_use_case.dart';

class HomeViewModel extends BaseViewModel {
  final List<RecipeEntity> recipes = [];

  void onRecipePressed({
    required final NavigatorState navigator,
    required final RecipeEntity recipe,
  }) {
    navigator.push(
      MaterialPageRoute(
        builder: (context) => const RecipeDetailView(),
        settings: RouteSettings(
          arguments: recipe,
        ),
      ),
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
}
