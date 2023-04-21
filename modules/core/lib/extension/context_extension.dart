import 'package:flutter/material.dart' show BuildContext;

import '../base/application_starter.dart';
import '../base/route_manager.dart';

extension BaseContextExtension on BuildContext {
  RouteManager get routeManager => ApplicationStarter.ofRouteManager(this);
}
