import 'package:core/widget/connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:presentation/exports.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(child: child ?? const RouteNotFoundView()),
        const ConnectivityWidget()
      ],
    );
  }
}
