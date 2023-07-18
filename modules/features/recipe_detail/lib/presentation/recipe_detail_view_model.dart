import 'package:core/base/base_view_model.dart';
import 'package:domain/domain.dart';

class RecipeDetailViewModel extends BaseViewModel {
  RecipeDetailViewModel({
    required this.recipe,
    required this.addFavoriteRecipeUseCase,
    required this.removeFavoriteRecipeUseCase,
    required this.getFavoriteRecipesUseCase,
  });

  final RecipeEntity recipe;
  final AddFavoriteRecipeUseCase addFavoriteRecipeUseCase;
  final RemoveFavoriteRecipe removeFavoriteRecipeUseCase;
  final GetFavoriteRecipesUseCase getFavoriteRecipesUseCase;

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
