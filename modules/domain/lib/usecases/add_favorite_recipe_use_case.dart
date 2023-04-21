import 'package:injectable/injectable.dart';

import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

@LazySingleton()
class AddFavoriteRecipeUseCase {
  final RecipeRepository repository;

  AddFavoriteRecipeUseCase({required this.repository});

  Future<void> call(RecipeEntity recipe) async {
    return repository.addFavoriteRecipe(recipe);
  }
}
