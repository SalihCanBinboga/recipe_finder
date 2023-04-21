// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeEntity _$RecipeEntityFromJson(Map<String, dynamic> json) => RecipeEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ingredientLines: (json['ingredientLines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$RecipeEntityToJson(RecipeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'ingredientLines': instance.ingredientLines,
      'url': instance.url,
    };
