import 'package:core/base/application_starter.dart';
import 'package:core/extension/context_extension.dart';
import 'package:core/widget/connectivity_widget/connectivity_widget.dart';

import 'package:flutter/material.dart';
import 'package:route_not_found/presentation/route_not_found_view.dart';

import '../router/route_manager_impl.dart';

class RecipeFinderApp extends StatelessWidget {
  const RecipeFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationStarter(
      routeManager: RouteManagerImpl(),
      child: Builder(
        builder: (appContext) {
          return MaterialApp(
            builder: (context, child) => ConnectivityWidget(
              child: child ?? const RouteNotFoundView(),
            ),
            initialRoute: appContext.routeManager.initialRoute,
            onGenerateRoute: appContext.routeManager.generateRoute,
          );
        },
      ),
    );
  }
}
