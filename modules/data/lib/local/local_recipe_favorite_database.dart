import 'dart:async';
import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_sources/constants/local_storage_keys.dart';

@LazySingleton(as: LocalRecipeFavoriteDataSource)
class LocalRecipeFavoriteDatabase extends LocalRecipeFavoriteDataSource {
  final SharedPreferences _database;

  LocalRecipeFavoriteDatabase(this._database);

  @override
  Future<List<Map<String, dynamic>>> getFavoriteRecipes() async {
    final String? localRecipes = _database.getString(
      LocalStorageKeys.recipes.name,
    );

    if (localRecipes == null) {
      return [];
    } else {
      final List<dynamic> localRecipesList = json.decode(localRecipes);

      return localRecipesList
          .map(
            (e) => e as Map<String, dynamic>,
          )
          .toList();
    }
  }

  @override
  Future<void> removeRecipe(String recipeId) async {
    final String? localRecipes = _database.getString(
      LocalStorageKeys.recipes.name,
    );

    if (localRecipes == null) {
      return;
    } else {
      final List<dynamic> localRecipesList = json.decode(localRecipes);

      final recipeIndex = localRecipesList.indexWhere(
        (element) => element['id'] == recipeId,
      );

      if (recipeIndex == -1) {
        return;
      }

      localRecipesList.removeAt(recipeIndex);
      final encodedRecipes = json.encode(localRecipesList);

      await _database.setString(LocalStorageKeys.recipes.name, encodedRecipes);
    }
  }

  @override
  Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    final String? localRecipes = _database.getString(
      LocalStorageKeys.recipes.name,
    );

    if (localRecipes == null) {
      final localRecipesList = <Map<String, dynamic>>[];
      localRecipesList.add(recipe);
      final encodedRecipes = json.encode(localRecipesList);
      await _database.setString(LocalStorageKeys.recipes.name, encodedRecipes);
    } else {
      final List<dynamic> localRecipesList = json.decode(localRecipes);

      localRecipesList.add(recipe);
      final encodedRecipes = json.encode(localRecipesList);
      await _database.setString(LocalStorageKeys.recipes.name, encodedRecipes);
    }
  }
}
