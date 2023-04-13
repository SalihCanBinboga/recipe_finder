import 'package:flutter/material.dart';
import 'package:recipe_finder/app/core/base/reactive_base_view.dart';

import '../../../domain/models/recipe_entity/recipe_entity.dart';
import 'recipe_detail_view_model.dart';

class RecipeDetailView
    extends ReactiveBaseView<RecipeDetailViewModel, RecipeEntity> {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context, RecipeDetailViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Detail'),
      ),
      body: Column(
        children: [
          Text('Recipe Title: ${viewModel.recipe.name}'),
          ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: viewModel.recipe.ingredients.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final ingredient = viewModel.recipe.ingredients[index];

              return Text(ingredient);
            },
          ),
        ],
      ),
    );
  }

  @override
  RecipeDetailViewModel createViewModel({
    required RecipeEntity routeArgument,
  }) {
    return RecipeDetailViewModel(
      recipe: routeArgument,
    );
  }
}
