import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:recipe_finder/app/domain/models/recipe_entity/recipe_entity.dart';
import 'package:recipe_finder/app/presentation/screens/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  // TODO: 13.04.2023 13:53 create state management structure
  HomeView({super.key}) {
    viewModel = HomeViewModel();
  }

  late final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: viewModel.recipesNotifier,
              builder: (___, __, _) => ListView.builder(
                itemCount: viewModel.recipesNotifier.value.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final RecipeEntity recipe =
                      viewModel.recipesNotifier.value[index];

                  return ListTile(
                    title: Text(recipe.name),
                    leading: Image.network(recipe.imageUrl),
                    minVerticalPadding: 32,
                    onTap: viewModel.onRecipePressed,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
