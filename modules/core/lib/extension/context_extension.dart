import 'package:flutter/material.dart';

import '../base/application_starter.dart';
import '../base/route_manager.dart';

extension BaseContextExtension on BuildContext {
  RouteManager get routeManager => ApplicationStarter.ofRouteManager(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  NavigatorState get nearestNavigator => Navigator.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;
}
