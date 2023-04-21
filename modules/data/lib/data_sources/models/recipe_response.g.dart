// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeResponse _$RecipeResponseFromJson(Map<String, dynamic> json) =>
    RecipeResponse(
      id: RecipeResponse._fromJsonForId(json['uri'] as String),
      name: json['label'] as String,
      imageUrl: json['image'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientLines: (json['ingredientLines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$RecipeResponseToJson(RecipeResponse instance) =>
    <String, dynamic>{
      'uri': instance.id,
      'label': instance.name,
      'image': instance.imageUrl,
      'ingredients': instance.ingredients,
      'ingredientLines': instance.ingredientLines,
      'url': instance.url,
    };
