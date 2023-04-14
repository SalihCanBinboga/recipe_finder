import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            children: [
              Hero(
                tag: viewModel.recipe.id,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    viewModel.recipe.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: 300,
                  ),
                ),
              ),
              const Gap(8),
              Text(
                viewModel.recipe.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: viewModel.recipe.ingredientLines.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final ingredient = viewModel.recipe.ingredientLines[index];

                    return Text(ingredient);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Wrap(
                spacing: 8,
                children: viewModel.recipe.ingredients
                    .map(
                      (label) => Chip(
                        label: Text(label),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
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
