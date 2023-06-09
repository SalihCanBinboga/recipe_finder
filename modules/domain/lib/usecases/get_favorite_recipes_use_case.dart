import 'package:injectable/injectable.dart';

import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

@LazySingleton()
class GetFavoriteRecipesUseCase {
  final RecipeRepository repository;

  GetFavoriteRecipesUseCase({required this.repository});

  Future<List<RecipeEntity>> call() async {
    final response = await repository.getFavoriteRecipes();
    return response.toList();
  }
}
