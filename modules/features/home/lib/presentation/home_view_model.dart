import 'package:core/base/base_view_model.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:route_information/route_information.dart';

import '../home.module.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.getLastQueryRecipesUseCase);

  final GetLastQueryRecipesUseCase getLastQueryRecipesUseCase;

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
    final useCase = homeGetIt<SearchRecipesUseCase>();

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
    final result = await getLastQueryRecipesUseCase();
    recipes.replaceRange(0, recipes.length, result);
    notifyListeners();
  }
}
