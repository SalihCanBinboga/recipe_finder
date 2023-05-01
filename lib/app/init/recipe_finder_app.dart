import 'package:core/base/application_starter_widget.dart';
import 'package:core/extension/context_extension.dart';
import 'package:presentation/presentation.dart';

import 'package:flutter/material.dart';

class RecipeFinderApp extends StatelessWidget {
  const RecipeFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationStarterWidget(
      routeManager: RouteManagerImpl(),
      app: (context) => MaterialApp(
        initialRoute: context.routeManager.initialRoute,
        onGenerateRoute: context.routeManager.generateRoute,
      ),
    );
  }
}
