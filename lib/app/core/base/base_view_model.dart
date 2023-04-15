import 'package:flutter/material.dart' show BuildContext, ChangeNotifier;
import 'package:recipe_finder/app/presentation/router/route_manager.dart';
import 'package:recipe_finder/app/presentation/router/routes.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    initViewModel();
  }

  void initViewModel() {}

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context ??= context;
  }

  Future<T?> navigateTo<T extends Object?>(Routes route,
      {dynamic arguments}) async {
    if (_context == null) {
      return null;
    }

    return await RouteManager.navigateTo(
      _context!,
      route,
      arguments: arguments,
    );
  }
}
