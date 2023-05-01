import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/exports.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'startInjection',
  preferRelativeImports: true,
  asExtension: true,
  usesNullSafety: true,
  includeMicroPackages: true,
  throwOnMissingDependencies: true,
  externalPackageModulesBefore: [
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
    ExternalModule(PresentationPackageModule),
    ExternalModule(PresentationInstancePackageModule)
  ],
)
Future<void> configureDependencies() async => await getIt.startInjection();
