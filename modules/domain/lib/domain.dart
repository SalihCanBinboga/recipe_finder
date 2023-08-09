library domain;

import 'package:injectable/injectable.dart';
export 'exports.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
  usesNullSafety: true,
)
void initMicroPackage() {}
