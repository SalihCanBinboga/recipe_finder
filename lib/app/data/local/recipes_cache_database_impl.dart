import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:recipe_finder/app/data/data_sources/local/recipes_cache_database.dart';
import 'package:recipe_finder/app/data/data_sources/models/recipe_response.dart';
import 'package:sqflite/sqflite.dart';

import '../data_sources/constants/local_storage_keys.dart';

@LazySingleton(as: RecipesCacheDatabase)
class RecipesCacheDatabaseImpl extends RecipesCacheDatabase {
  static const _cacheExpirationDuration = Duration(hours: 1);

  final Database _database;

  RecipesCacheDatabaseImpl(this._database);

  @override
  Future<void> cacheRecipes(Iterable<RecipeResponse> recipes) async {
    final expirationTime = DateTime.now().add(_cacheExpirationDuration);
    final cacheData = _CacheData(expirationTime, recipes);
    final cacheJson = jsonEncode(cacheData.toJson());

    await clearCache();

    await _database.rawInsert(
      'INSERT INTO ${LocalStorageKeys.recipesCache.name} (data) VALUES (?)',
      [cacheJson],
    );
  }

  @override
  Future<Iterable<RecipeResponse>> getRecipes() async {
    final result = await _database.query(
      LocalStorageKeys.recipesCache.name,
      columns: ['data'],
    );

    if (result.isEmpty) {
      return [];
    }

    final cacheJson = result.first['data'] as String;
    final cacheData = _CacheData.fromJson(jsonDecode(cacheJson));
    if (cacheData.expirationTime.isBefore(DateTime.now())) {
      await clearCache();
      return [];
    }

    return cacheData.recipes;
  }

  @override
  Future<void> clearCache() async {
    await _database.delete(LocalStorageKeys.recipesCache.name);
  }
}

class _CacheData {
  final DateTime expirationTime;
  final Iterable<RecipeResponse> recipes;

  _CacheData(this.expirationTime, this.recipes);

  factory _CacheData.fromJson(Map<String, dynamic> json) {
    final expirationTime = DateTime.parse(json['expirationTime']);
    final recipes = (json['recipes'] as List<dynamic>)
        .map((e) => RecipeResponse.fromJson(e))
        .toList();
    return _CacheData(expirationTime, recipes);
  }

  Map<String, dynamic> toJson() {
    final recipesJson = recipes.map((e) => e.toJson()).toList();

    return {
      'expirationTime': expirationTime.toIso8601String(),
      'recipes': recipesJson,
    };
  }
}
