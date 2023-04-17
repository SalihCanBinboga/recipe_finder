import 'package:flutter/material.dart';

import '../presentation/router/route_manager.dart';

class RecipeFinderApp extends StatelessWidget {
  const RecipeFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteManager.initialRoute,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
