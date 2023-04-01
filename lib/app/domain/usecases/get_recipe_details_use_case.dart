import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

class GetRecipeDetailsUseCase {
  final RecipeRepository repository;

  GetRecipeDetailsUseCase({required this.repository});

  Future<RecipeEntity> call(String recipeId) async {
    return repository.getRecipeDetails(recipeId);
  }
}
