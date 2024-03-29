import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'recipe_detail_view_model.dart';

class RecipeDetailView extends ReactiveBaseView<RecipeDetailViewModel> {
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
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Hero(
                      tag: viewModel.args.id,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          viewModel.args.imageUrl,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 300,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(
                            viewModel.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: viewModel.toggleFavorite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              Text(
                viewModel.args.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: viewModel.args.ingredientLines.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final ingredient = viewModel.args.ingredientLines[index];

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
                children: viewModel.args.ingredients
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
  RecipeDetailViewModel createViewModel() {
    return diContainer<RecipeDetailViewModel>();
  }
}
