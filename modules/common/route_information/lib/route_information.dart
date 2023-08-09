library route_information;

import 'package:flutter/material.dart' show RouteSettings;

enum Routes {
  home('/'),
  notFound('/not-found'),
  recipeDetail('/recipe-detail'),
  favouriteRecipes('/favourite-recipes');

  const Routes(this.path);

  final String path;

  static Routes fromRouteSettings(RouteSettings settings) {
    return Routes.values.firstWhere(
      (route) => route.path == settings.name,
      orElse: () => Routes.notFound,
    );
  }
}
