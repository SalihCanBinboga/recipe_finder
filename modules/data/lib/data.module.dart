//@GeneratedMicroModule;DataPackageModule;package:data/data.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:sqflite/sqflite.dart' as _i3;

import 'data_sources/local/local_recipe_favorite_data_source.dart' as _i11;
import 'data_sources/local/recipes_cache_database.dart' as _i6;
import 'data_sources/remote/http_client.dart' as _i5;
import 'data_sources/remote/remote_recipe_data_source.dart' as _i8;
import 'di/modules/http_client_module.dart' as _i13;
import 'di/modules/recipe_database_module.dart' as _i14;
import 'di/modules/shared_preferences_module.dart' as _i15;
import 'local/local_recipe_favorite_database.dart' as _i12;
import 'local/recipes_cache_database_impl.dart' as _i7;
import 'remote/remote_recipe_data_source_impl.dart' as _i9;

class DataPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final recipeDatabaseModule = _$RecipeDatabaseModule();
    final httpClientModule = _$HttpClientModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    await gh.singletonAsync<_i3.Database>(
      () => recipeDatabaseModule.createDatabase(),
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(httpClientModule.dio());
    gh.singleton<_i5.HttpClient>(_i5.HttpClient(gh<_i4.Dio>()));
    gh.lazySingleton<_i6.RecipesCacheDatabase>(
        () => _i7.RecipesCacheDatabaseImpl(gh<_i3.Database>()));
    gh.lazySingleton<_i8.RemoteRecipeDataSource>(
        () => _i9.RemoteRecipeDataSourceImpl(gh<_i5.HttpClient>()));
    await gh.singletonAsync<_i10.SharedPreferences>(
      () => sharedPreferencesModule.createSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i11.LocalRecipeFavoriteDataSource>(
        () => _i12.LocalRecipeFavoriteDatabase(gh<_i10.SharedPreferences>()));
  }
}

class _$HttpClientModule extends _i13.HttpClientModule {}

class _$RecipeDatabaseModule extends _i14.RecipeDatabaseModule {}

class _$SharedPreferencesModule extends _i15.SharedPreferencesModule {}
