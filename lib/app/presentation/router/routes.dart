import 'package:flutter/material.dart' show RouteSettings;

enum Routes {
  home('/'),
  recipeDetail('/recipe-detail');

  const Routes(this.path);

  final String path;

  static Routes fromRouteSettings(RouteSettings settings) {
    return Routes.values.firstWhere(
      (route) => route.path == settings.name,
    );
  }
}
