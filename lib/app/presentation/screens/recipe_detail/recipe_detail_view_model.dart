import 'package:core/base/base_view_model.dart';
import 'package:recipe_finder/app/domain/usecases/remove_favorite_recipe_use_case.dart';

import '../../../domain/models/recipe_entity/recipe_entity.dart';
import '../../../domain/usecases/add_favorite_recipe_use_case.dart';
import '../../../domain/usecases/get_favorite_recipes_use_case.dart';

class RecipeDetailViewModel extends BaseViewModel {
  final RecipeEntity recipe;
  final AddFavoriteRecipeUseCase addFavoriteRecipeUseCase;
  final RemoveFavoriteRecipe removeFavoriteRecipeUseCase;
  final GetFavoriteRecipesUseCase getFavoriteRecipesUseCase;

  RecipeDetailViewModel({
    required this.recipe,
    required this.addFavoriteRecipeUseCase,
    required this.removeFavoriteRecipeUseCase,
    required this.getFavoriteRecipesUseCase,
  });

  @override
  void initViewModel() {
    _getFavoriteRecipes();
    super.initViewModel();
  }

  final List<RecipeEntity> favoriteRecipes = [];

  bool get isFavorite {
    return favoriteRecipes
        .where(
          (element) => element.id == recipe.id,
        )
        .isNotEmpty;
  }

  Future<void> toggleFavorite() async {
    if (isFavorite) {
      await removeFavoriteRecipeUseCase(recipe);
      favoriteRecipes.remove(recipe);
    } else {
      await addFavoriteRecipeUseCase(recipe);
      favoriteRecipes.add(recipe);
    }

    notifyListeners();
  }

  Future<void> _getFavoriteRecipes() async {
    final favoriteRecipeUseCase = await getFavoriteRecipesUseCase();
    favoriteRecipes.clear();
    favoriteRecipes.addAll(favoriteRecipeUseCase);
    notifyListeners();
  }
}
