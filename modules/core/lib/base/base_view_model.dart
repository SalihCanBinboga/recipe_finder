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
    if (_context == null) {
      return null;
    }

    final routeManager = ApplicationStarter.ofRouteManager(_context!);

    return await routeManager.navigateTo(
      _context!,
      route,
      arguments: arguments,
    );
  }
}
