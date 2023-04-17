import 'package:injectable/injectable.dart';

import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

@lazySingleton
class GetLastQueryRecipesUseCase {
  final RecipeRepository repository;

  GetLastQueryRecipesUseCase({
    required this.repository,
  });

  Future<Iterable<RecipeEntity>> call() async {
    return await repository.getRecipes();
  }
}
