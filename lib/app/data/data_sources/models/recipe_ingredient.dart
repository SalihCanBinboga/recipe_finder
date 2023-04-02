import 'package:json_annotation/json_annotation.dart';

part 'recipe_ingredient.g.dart';

@JsonSerializable()
class RecipeIngredient {
  final String text;
  final double quantity;
  final String measure;
  final String food;

  RecipeIngredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}
