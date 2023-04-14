import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder/app/core/base/base_view.dart';
import 'package:recipe_finder/app/domain/models/recipe_entity/recipe_entity.dart';
import 'package:recipe_finder/app/presentation/screens/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: (_) => HomeViewModel(),
      builder: (_, HomeViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: viewModel.onSearchTextChanged,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                  ),
                ),
              ),
              const Gap(16),
              const Expanded(
                child: _RecipeListWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RecipeListWidget extends StatelessWidget {
  const _RecipeListWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return ListView.builder(
      itemCount: viewModel.recipes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final RecipeEntity recipe = viewModel.recipes[index];

        return ListTile(
          title: Text(recipe.name),
          leading: Hero(
            tag: recipe.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                recipe.imageUrl,
              ),
            ),
          ),
          minVerticalPadding: 32,
          onTap: () {
            final navigator = Navigator.of(context);

            viewModel.onRecipePressed(
              navigator: navigator,
              recipe: recipe,
            );
          },
        );
      },
    );
  }
}
