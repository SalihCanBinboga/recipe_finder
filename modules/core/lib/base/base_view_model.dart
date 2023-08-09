// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:core/extension/context_extension.dart';
import 'package:flutter/material.dart';

typedef SuspendCallback = Future<void> Function();

abstract class BaseViewModel<A> extends ChangeNotifier {
  BaseViewModel() {
    initViewModel();
  }

  A? _args;

  A get args {
    if (_args == null) {
      throw Exception('Args is null');
    }

    return _args!;
  }

  set args(A value) {
    _args = value;
  }

  final Completer<BuildContext> _contextCompleter = Completer<BuildContext>();

  void initViewModel() {}

  void onBindViewModel() {}

  void setContext(BuildContext context) {
    if (!_contextCompleter.isCompleted) {
      _contextCompleter.complete(context);
      onBindViewModel();
    }
  }

  Future<T?> navigateTo<T extends Object?>(
    String route, {
    dynamic arguments,
  }) async {
    final context = await _contextCompleter.future;

    final routeManager = context.routeManager;

    return routeManager.navigateTo(
      context,
      route,
      arguments: arguments,
    );
  }

  Future<void> setWorkingStatus(bool status) async {
    final context = await _contextCompleter.future;

    final screenWorker = context.screenWorkingManager;

    if (status) {
      screenWorker?.showLoading(context);
    } else {
      screenWorker?.hideLoading();
    }
  }

  int _workerCount = 0;

  Future<void> suspend(final SuspendCallback callback) async {
    try {
      _workerCount++;
      await setWorkingStatus(true);
      await callback();
    } catch (e, _) {
      log(e.toString());
      final context = await _contextCompleter.future;

      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      _workerCount--;

      if (_workerCount == 0) {
        await setWorkingStatus(false);
      }

      notifyListeners();
    }
  }
}
