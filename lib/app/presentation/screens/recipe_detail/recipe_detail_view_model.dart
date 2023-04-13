import 'package:recipe_finder/app/core/base/base_view_model.dart';

import '../../../domain/models/recipe_entity/recipe_entity.dart';

class RecipeDetailViewModel extends BaseViewModel {
  final RecipeEntity recipe;

  RecipeDetailViewModel({required this.recipe});
}
