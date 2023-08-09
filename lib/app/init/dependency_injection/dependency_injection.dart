import 'package:core/core.dart';
import 'package:data/data.module.dart';
import 'package:domain/domain.module.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

@InjectableInit(
  initializerName: 'startInjection',
  throwOnMissingDependencies: true,
  externalPackageModulesBefore: [
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
  ],
)
Future<void> configureDependencies() async => diContainer.startInjection();
