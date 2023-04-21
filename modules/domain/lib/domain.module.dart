//@GeneratedMicroModule;DomainPackageModule;package:domain/domain.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core/utils/debounce_manager.dart' as _i9;
import 'package:injectable/injectable.dart' as _i1;

import 'repositories/recipe_repository.dart' as _i4;
import 'usecases/add_favorite_recipe_use_case.dart' as _i3;
import 'usecases/get_favorite_recipes_use_case.dart' as _i5;
import 'usecases/get_last_query_recipes_use_case.dart' as _i6;
import 'usecases/remove_favorite_recipe_use_case.dart' as _i7;
import 'usecases/search_recipes_use_case.dart' as _i8;

class DomainPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.lazySingleton<_i3.AddFavoriteRecipeUseCase>(() =>
        _i3.AddFavoriteRecipeUseCase(repository: gh<_i4.RecipeRepository>()));
    gh.lazySingleton<_i5.GetFavoriteRecipesUseCase>(() =>
        _i5.GetFavoriteRecipesUseCase(repository: gh<_i4.RecipeRepository>()));
    gh.lazySingleton<_i6.GetLastQueryRecipesUseCase>(() =>
        _i6.GetLastQueryRecipesUseCase(repository: gh<_i4.RecipeRepository>()));
    gh.lazySingleton<_i7.RemoveFavoriteRecipe>(
        () => _i7.RemoveFavoriteRecipe(repository: gh<_i4.RecipeRepository>()));
    gh.lazySingleton<_i8.SearchRecipesUseCase>(() => _i8.SearchRecipesUseCase(
          repository: gh<_i4.RecipeRepository>(),
          debounceManager: gh<_i9.DebounceManager>(),
        ));
  }
}
