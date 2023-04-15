import 'package:injectable/injectable.dart';

import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

@injectable
class RemoveFavoriteRecipe {
  final RecipeRepository repository;

  RemoveFavoriteRecipe({required this.repository});

  Future<void> call(RecipeEntity recipe) async {
    return repository.removeFavoriteRecipe(recipe);
  }
}
