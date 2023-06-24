import 'package:flutter/material.dart' show BuildContext, InheritedWidget;

import '../utils/network_manager/base_network_manager.dart';
import '../utils/network_manager/network_manager.dart';
import 'route_manager.dart';
import 'screen_working_manager.dart';

class ApplicationStarter extends InheritedWidget {
  const ApplicationStarter({
    required super.child,
    required RouteManager routeManager,
    NetworkStateManager? networkStateManager,
    ScreenWorkingManager? screenWorkingManager,
    super.key,
  })  : _routeManager = routeManager,
        _networkStateManager = networkStateManager,
        _screenWorkingManager = screenWorkingManager;

  final RouteManager _routeManager;
  final NetworkStateManager? _networkStateManager;
  final ScreenWorkingManager? _screenWorkingManager;

  static RouteManager ofRouteManager(BuildContext context) {
    return ApplicationStarter.of(context)._routeManager;
  }

  static NetworkStateManager ofNetworkManager(BuildContext context) {
    final ApplicationStarter instance = ApplicationStarter.of(context);
    final instanceNetworkStateManager = instance._networkStateManager;

    return instanceNetworkStateManager ?? NetworkStateManagerImpl.instance;
  }

  static ScreenWorkingManager? ofScreenWorkingManager(BuildContext context) {
    final ApplicationStarter instance = ApplicationStarter.of(context);
    return instance._screenWorkingManager;
  }

  static ApplicationStarter of(BuildContext context) {
    final ApplicationStarter? result =
        context.dependOnInheritedWidgetOfExactType<ApplicationStarter>();
    assert(result != null, 'No ApplicationStarter found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ApplicationStarter oldWidget) {
    return _routeManager != oldWidget._routeManager;
  }
}
