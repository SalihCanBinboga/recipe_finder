//@GeneratedMicroModule;HomePackageModule;package:home/home.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

import 'presentation/home_view_model.dart' as _i3;

late _i1.GetItHelper homeGetIt;

class HomePackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    homeGetIt = gh;
    gh.factory<_i3.HomeViewModel>(
        () => _i3.HomeViewModel(gh<_i4.GetLastQueryRecipesUseCase>()));
  }
}
