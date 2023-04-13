import 'package:json_annotation/json_annotation.dart';

import 'recipe_ingredient.dart';

part 'recipe_response.g.dart';

@JsonSerializable()
class RecipeResponse {
  @JsonKey(
    name: 'uri',
    fromJson: _fromJsonForId,
  )
  final String id;

  @JsonKey(name: 'label')
  final String name;

  @JsonKey(name: 'image')
  final String imageUrl;
  final List<RecipeIngredient> ingredients;
  final List<String> ingredientLines;
  final String url;

  const RecipeResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.ingredientLines,
    required this.url,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json['recipe']);

  Map<String, dynamic> toJson() => _$RecipeResponseToJson(this);

  static String _fromJsonForId(String uri) {
    final recipeId = uri.split('recipe_').last;
    return recipeId;
  }
}
