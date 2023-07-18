import 'package:core/base/route_manager.dart';
import 'package:favourite_recipes/presentation/favourite_recipes_view.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/home_view.dart';
import 'package:recipe_detail/presentation/recipe_detail_view.dart';
import 'package:route_information/route_information.dart';
import 'package:route_not_found/presentation/route_not_found_view.dart';

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
