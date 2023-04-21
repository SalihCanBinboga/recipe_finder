import 'package:core/base/base_view.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder/app/init/dependency_injection/dependency_injection.dart';
import 'package:recipe_finder/app/presentation/screens/home/home_view_model.dart';

import '../../components/recipe_list_item_widget.dart';

class HomeView extends BaseView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: viewModel.onFavouriteRecipesPressed,
          ),
        ],
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
  }

  @override
  HomeViewModel viewModel(BuildContext context) {
    return getIt<HomeViewModel>();
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

        return RecipeListItemWidget(
          recipe: recipe,
          onRecipePressed: viewModel.onRecipePressed,
        );
      },
    );
  }
}
