import 'package:json_annotation/json_annotation.dart';

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

  factory RecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$RecipeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeEntityToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
