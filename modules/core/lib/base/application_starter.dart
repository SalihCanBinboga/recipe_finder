import 'package:flutter/material.dart' show BuildContext, InheritedWidget;

import 'route_manager.dart';

class ApplicationStarter extends InheritedWidget {
  const ApplicationStarter({
    required super.child,
    required RouteManager routeManager,
    super.key,
  }) : _routeManager = routeManager;

  final RouteManager _routeManager;

  static RouteManager ofRouteManager(BuildContext context) {
    return ApplicationStarter.of(context)._routeManager;
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
