import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'startInjection',
  preferRelativeImports: true,
  asExtension: true,
  usesNullSafety: true,
  includeMicroPackages: true,
  throwOnMissingDependencies: true,
)
void configureDependencies() => getIt.startInjection();
