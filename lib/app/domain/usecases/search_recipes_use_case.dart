import 'package:injectable/injectable.dart';

import '../../core/utils/debounce_manager.dart';
import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

@LazySingleton()
class SearchRecipesUseCase {
  final RecipeRepository repository;

  SearchRecipesUseCase({required this.repository});

  Future<List<RecipeEntity>> call({
    required final String query,
  }) async {
    final result = await repository.getRecipes();

    // Users should be able to search for recipes based on ingredients or recipe names.
    return result.where((recipe) {
      final ingredients = recipe.ingredients.contains(query);
      final recipeName = recipe.name;

      return ingredients || recipeName.contains(query);
    }).toList();
  }
}
