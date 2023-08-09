import 'package:core/base/view_args.dart';
import 'package:flutter/material.dart'
    show BuildContext, Navigator, Route, RouteSettings;

abstract class RouteManager {
  String get initialRoute;

  Route<dynamic>? generateRoute(RouteSettings settings);

  Future<T?> navigateTo<T extends Object?>(
    BuildContext context,
    String route, {
    dynamic arguments,
  }) {
    return Navigator.pushNamed<T>(
      context,
      route,
      arguments: _composeArguments<T>(arguments),
    );
  }

  ViewArgs<T> _composeArguments<T extends Object?>(arguments) {
    return ViewArgs<T>(
      data: arguments,
    );
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
