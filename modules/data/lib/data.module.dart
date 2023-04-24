//@GeneratedMicroModule;DataPackageModule;package:data/data.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i4;
import 'package:domain/domain.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:sqflite/sqflite.dart' as _i3;

import 'data_sources/remote/http_client.dart' as _i5;
import 'di/modules/http_client_module.dart' as _i12;
import 'di/modules/recipe_database_module.dart' as _i13;
import 'di/modules/shared_preferences_module.dart' as _i14;
import 'local/local_recipe_favorite_database.dart' as _i10;
import 'local/recipes_cache_database_impl.dart' as _i7;
import 'remote/remote_recipe_data_source_impl.dart' as _i8;
import 'repositories/recipe_repository_impl.dart' as _i11;

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
    gh.lazySingleton<_i6.RemoteRecipeDataSource>(
        () => _i8.RemoteRecipeDataSourceImpl(gh<_i5.HttpClient>()));
    await gh.singletonAsync<_i9.SharedPreferences>(
      () => sharedPreferencesModule.createSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i6.LocalRecipeFavoriteDataSource>(
        () => _i10.LocalRecipeFavoriteDatabase(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i6.RecipeRepository>(() => _i11.RecipeRepositoryImpl(
          remoteDataSource: gh<_i6.RemoteRecipeDataSource>(),
          localFavoriteDataSource: gh<_i6.LocalRecipeFavoriteDataSource>(),
          recipesCacheDatabase: gh<_i6.RecipesCacheDatabase>(),
        ));
  }
}

class _$HttpClientModule extends _i12.HttpClientModule {}

class _$RecipeDatabaseModule extends _i13.RecipeDatabaseModule {}

class _$SharedPreferencesModule extends _i14.SharedPreferencesModule {}
