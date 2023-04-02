import 'package:json_annotation/json_annotation.dart';

import '../../../data/data_sources/models/recipe_response.dart';

part 'recipe_entity.g.dart';

@JsonSerializable()
class RecipeEntity {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> ingredientLines;
  final String url;

  const RecipeEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.ingredientLines,
    required this.url,
  });

  factory RecipeEntity.fromRecipeResponse(RecipeResponse recipe) {
    return RecipeEntity(
      id: recipe.id,
      name: recipe.name,
      imageUrl: recipe.imageUrl,
      ingredients: recipe.ingredients.map((e) => e.food).toList(),
      ingredientLines: recipe.ingredientLines,
      url: recipe.url,
    );
  }

  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeEntityToJson(this);
}
