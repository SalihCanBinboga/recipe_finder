import 'package:flutter/cupertino.dart';
import 'package:recipe_finder/app/domain/models/recipe_entity/recipe_entity.dart';
import 'package:recipe_finder/app/init/dependency_injection/dependency_injection.dart';

import '../../../domain/usecases/search_recipes_use_case.dart';

class HomeViewModel {
  // TODO: 13.04.2023 13:55 manage dispose method
  final ValueNotifier<List<RecipeEntity>> recipesNotifier = ValueNotifier(
    [],
  );

  void onRecipePressed() {
    // TODO: 12.04.2023 15:34 navigate to recipe detail
  }

  void onSearchTextChanged(String query) {
    final useCase = getIt<SearchRecipesUseCase>();

    useCase(
      query: query,
      onResult: (List<RecipeEntity> response) {
        recipesNotifier.value.clear();
        recipesNotifier.value.addAll(response);
        recipesNotifier.notifyListeners();
      },
    );
  }
}
