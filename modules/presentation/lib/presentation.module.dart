//@GeneratedMicroModule;PresentationPackageModule;package:presentation/presentation.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'screens/favourite_recipes/favourite_recipes_view_model.dart' as _i3;
import 'screens/home/home_view_model.dart' as _i5;

class PresentationPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.FavouriteRecipesViewModel>(() =>
        _i3.FavouriteRecipesViewModel(gh<_i4.GetFavoriteRecipesUseCase>()));
    gh.factory<_i5.HomeViewModel>(
        () => _i5.HomeViewModel(gh<_i4.GetLastQueryRecipesUseCase>()));
  }
}
