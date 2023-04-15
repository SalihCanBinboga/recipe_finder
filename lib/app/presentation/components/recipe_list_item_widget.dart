import 'package:flutter/material.dart';

import '../../domain/models/recipe_entity/recipe_entity.dart';

class RecipeListItemWidget extends StatelessWidget {
  const RecipeListItemWidget({
    Key? key,
    required this.recipe,
    required this.onRecipePressed,
  }) : super(key: key);

  final RecipeEntity recipe;
  final Function(RecipeEntity) onRecipePressed;

  @override
  Widget build(BuildContext context) {
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
        onRecipePressed(recipe);
      },
    );
  }
}
