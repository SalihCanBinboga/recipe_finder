import 'package:flutter/material.dart'
    show BuildContext, Builder, StatelessWidget, Widget;

import 'application_starter.dart';
import 'route_manager.dart';

typedef AppStarterCallBack = Widget Function(BuildContext context);

class ApplicationStarterWidget extends StatelessWidget {
  const ApplicationStarterWidget({
    required this.app,
    required this.routeManager,
    super.key,
  });

  final AppStarterCallBack app;
  final RouteManager routeManager;

  @override
  Widget build(BuildContext context) {
    return ApplicationStarter(
      routeManager: routeManager,
      child: Builder(
        builder: (appContext) {
          return app(appContext);
        },
      ),
    );
  }
}
