import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:recipe_finder/app/data/data_sources/local/local_recipe_favorite_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_sources/constants/local_storage_keys.dart';

@LazySingleton(as: LocalRecipeFavoriteDataSource)
class LocalRecipeFavoriteDatabase extends LocalRecipeFavoriteDataSource {
  static final LocalRecipeFavoriteDatabase _instance =
      LocalRecipeFavoriteDatabase._internal();

  factory LocalRecipeFavoriteDatabase() => _instance;

  LocalRecipeFavoriteDatabase._internal() {
    _initLocalDatabase();
  }

  SharedPreferences? _database;

  final Completer<SharedPreferences> _dbInitializer =
      Completer<SharedPreferences>();

  Future<void> _initLocalDatabase() async {
    _database = await SharedPreferences.getInstance();
    _dbInitializer.complete(_database);
  }

  @override
  Future<List<Map<String, dynamic>>> getFavoriteRecipes() async {
    await _dbInitializer.future;

    final String? localRecipes = _database!.getString(
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
    await _dbInitializer.future;

    final String? localRecipes = _database!.getString(
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

      await _database!.setString(LocalStorageKeys.recipes.name, encodedRecipes);
    }
  }

  @override
  Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    await _dbInitializer.future;

    final String? localRecipes = _database!.getString(
      LocalStorageKeys.recipes.name,
    );

    if (localRecipes == null) {
      final localRecipesList = <Map<String, dynamic>>[];
      localRecipesList.add(recipe);
      final encodedRecipes = json.encode(localRecipesList);
      await _database!.setString(LocalStorageKeys.recipes.name, encodedRecipes);
    } else {
      final List<dynamic> localRecipesList = json.decode(localRecipes);

      localRecipesList.add(recipe);
      final encodedRecipes = json.encode(localRecipesList);
      await _database!.setString(LocalStorageKeys.recipes.name, encodedRecipes);
    }
  }
}
