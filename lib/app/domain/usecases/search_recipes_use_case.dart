import 'package:injectable/injectable.dart';

import '../../core/utils/debounce_manager.dart';
import '../models/recipe_entity/recipe_entity.dart';
import '../repositories/recipe_repository.dart';

@LazySingleton()
class SearchRecipesUseCase {
  final RecipeRepository repository;

  SearchRecipesUseCase({required this.repository});

  final DebounceManager debounceManager = DebounceManager();

  void call({
    required final String query,
    required final Function(List<RecipeEntity>) onResult,
  }) {
    debounceManager.run(
      () async {
        final result = await repository.searchRecipes(
          query: query,
        );

        onResult(result.toList());
      },
    );
  }
}
