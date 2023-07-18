import 'package:core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:ui/components/recipe_list_item_widget.dart';

import '../favourite_recipes.module.dart';
import 'favourite_recipes_view_model.dart';

class FavouriteRecipesView extends BaseView<FavouriteRecipesViewModel> {
  const FavouriteRecipesView({super.key});

  @override
  Widget builder(BuildContext context, FavouriteRecipesViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Recipes'),
      ),
      body: viewModel.favoriteRecipes.isEmpty
          ? const Center(
              child: Text('No favourite recipes'),
            )
          : ListView.builder(
              itemCount: viewModel.favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = viewModel.favoriteRecipes[index];
                return RecipeListItemWidget(
                  recipe: recipe,
                  onRecipePressed: viewModel.onRecipePressed,
                );
              },
            ),
    );
  }

  @override
  FavouriteRecipesViewModel viewModelBuilder(BuildContext context) {
    return favouriteRecipesGetIt<FavouriteRecipesViewModel>();
  }
}
