import 'package:core/base/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:recipe_finder/app/presentation/screens/favourite_recipes/favourite_recipes_view.dart';
import 'package:recipe_finder/app/presentation/screens/route_not_found/route_not_found_view.dart';

import '../screens/home/home_view.dart';
import '../screens/recipe_detail/recipe_detail_view.dart';
import 'routes.dart';

class RouteManagerImpl extends RouteManager {
  @override
  String get initialRoute => Routes.home.path;

  @override
  Route? generateRoute(RouteSettings settings) {
    final route = Routes.fromRouteSettings(settings);

    WidgetBuilder? builder;

    switch (route) {
      case Routes.home:
        builder = (_) => const HomeView();
        break;
      case Routes.recipeDetail:
        builder = (_) => const RecipeDetailView();
        break;
      case Routes.favouriteRecipes:
        builder = (_) => const FavouriteRecipesView();
        break;
      case Routes.notFound:
        builder = (_) => const RouteNotFoundView();
        break;
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
