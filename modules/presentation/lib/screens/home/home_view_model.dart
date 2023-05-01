import 'package:core/base/base_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../presentation_instance.module.dart';
import '../../router/routes.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final GetLastQueryRecipesUseCase getLastQueryRecipesUseCase;

  HomeViewModel(this.getLastQueryRecipesUseCase);

  final List<RecipeEntity> recipes = [];

  @override
  void initViewModel() {
    getLastQueryRecipes();
    super.initViewModel();
  }

  void onRecipePressed(RecipeEntity recipe) {
    navigateTo(
      Routes.recipeDetail.path,
      arguments: recipe,
    );
  }

  void onSearchTextChanged(String query) {
    final useCase = getIt<SearchRecipesUseCase>();

    useCase(
      query: query,
      onResult: (List<RecipeEntity> response) {
        recipes.replaceRange(0, recipes.length, response);
        notifyListeners();
      },
    );
  }

  void onFavouriteRecipesPressed() {
    navigateTo(
      Routes.favouriteRecipes.path,
    );
  }

  Future<void> getLastQueryRecipes() async {
    final useCase = getIt<GetLastQueryRecipesUseCase>();
    final result = await useCase();
    recipes.replaceRange(0, recipes.length, result);
    notifyListeners();
  }
}
