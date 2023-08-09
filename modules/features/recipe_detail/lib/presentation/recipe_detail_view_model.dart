import 'package:core/base/base_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeDetailViewModel extends BaseViewModel<RecipeEntity> {
  RecipeDetailViewModel({
    required this.addFavoriteRecipeUseCase,
    required this.removeFavoriteRecipeUseCase,
    required this.getFavoriteRecipesUseCase,
  });

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
          (element) => element.id == args.id,
        )
        .isNotEmpty;
  }

  Future<void> toggleFavorite() async {
    if (isFavorite) {
      await removeFavoriteRecipeUseCase(args);
      favoriteRecipes.remove(args);
    } else {
      await addFavoriteRecipeUseCase(args);
      favoriteRecipes.add(args);
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
