library recipe_detail;

import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
  throwOnMissingDependencies: true,
  createGetItHelper: true,
)
void initMicroPackage() {}
