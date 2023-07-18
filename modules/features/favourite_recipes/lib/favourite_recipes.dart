library favourite_recipes;

import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
  createGetItHelper: true,
)
void initMicroPackage() {}
