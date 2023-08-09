library home;

import 'package:domain/usecases/get_last_query_recipes_use_case.dart';
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
  usesNullSafety: true,
  ignoreUnregisteredTypes: [
    GetLastQueryRecipesUseCase,
  ],
  throwOnMissingDependencies: true,
)
void initMicroPackage() {}
