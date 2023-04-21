import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

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
          child: CachedNetworkImage(
            imageUrl: recipe.imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return CircularProgressIndicator(
                value: downloadProgress.progress,
              );
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
