import 'package:flutter/material.dart' show BuildContext, ChangeNotifier;

import 'application_starter.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    initViewModel();
  }

  void initViewModel() {}

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context ??= context;
  }

  Future<T?> navigateTo<T extends Object?>(
    String route, {
    dynamic arguments,
  }) async {
    final BuildContext? context = _context;

    if (context == null) {
      return null;
    }

    final routeManager = ApplicationStarter.ofRouteManager(context);

    return await routeManager.navigateTo(
      context,
      route,
      arguments: arguments,
    );
  }
}
