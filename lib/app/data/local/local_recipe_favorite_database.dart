import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_finder/app/data/data_sources/local/local_recipe_favorite_data_source.dart';

import '../data_sources/constants/local_storage_keys.dart';

class LocalRecipeFavoriteDatabase extends LocalRecipeFavoriteDataSource {
  static final LocalRecipeFavoriteDatabase _instance =
      LocalRecipeFavoriteDatabase._internal();

  factory LocalRecipeFavoriteDatabase() => _instance;

  LocalRecipeFavoriteDatabase._internal() {
    _initHive();
  }

  Box? _box;

  final Completer<Box> _hiveInitializer = Completer<Box>();

  Future<void> _initHive() async {
    _box = await Hive.openBox(LocalStorageKeys.recipes.name);
    _hiveInitializer.complete(_box);
  }

  @override
  Future<List<Map<String, dynamic>>> getFavoriteRecipes() async {
    await _hiveInitializer.future;

    final List<Map<String, dynamic>> recipes = [];
    final localRecipes = _box!.get(LocalStorageKeys.recipes.name);

    if (localRecipes != null) {
      recipes.addAll(localRecipes);
    }

    return recipes;
  }

  @override
  Future<void> removeRecipe(String recipeId) async {
    await _hiveInitializer.future;

    final localRecipes = _box!.get(LocalStorageKeys.recipes.name);

    if (localRecipes != null) {
      final List<Map<String, dynamic>> recipes = [];
      recipes.addAll(localRecipes);
      recipes.removeWhere((recipe) => recipe['id'] == recipeId);
      await _box!.put(LocalStorageKeys.recipes.name, recipes);
    }
  }

  @override
  Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    await _hiveInitializer.future;

    final localRecipes = _box!.get(LocalStorageKeys.recipes.name);

    if (localRecipes != null) {
      final List<Map<String, dynamic>> recipes = [];
      recipes.addAll(localRecipes);
      recipes.add(recipe);
      await _box!.put(LocalStorageKeys.recipes.name, recipes);
    } else {
      await _box!.put(LocalStorageKeys.recipes.name, [recipe]);
    }
  }
}
