import 'package:core/base/base_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../router/routes.dart';

@injectable
class FavouriteRecipesViewModel extends BaseViewModel {
  final GetFavoriteRecipesUseCase getFavoriteRecipesUseCase;

  FavouriteRecipesViewModel(this.getFavoriteRecipesUseCase);

  final List<RecipeEntity> favoriteRecipes = [];

  @override
  void initViewModel() {
    _getFavoriteRecipes();
  }

  Future<void> _getFavoriteRecipes() async {
    final favoriteRecipeUseCase = await getFavoriteRecipesUseCase();
    favoriteRecipes.clear();
    favoriteRecipes.addAll(favoriteRecipeUseCase);
    notifyListeners();
  }

  Future<void> onRecipePressed(
    RecipeEntity recipe,
  ) async {
    await navigateTo(
      Routes.recipeDetail.path,
      arguments: recipe,
    );
    _getFavoriteRecipes();
  }
}
