import 'package:flutter/material.dart';

abstract class ScreenWorkingManager {
  ScreenWorkingManager({required this.context});

  final BuildContext context;

  void showLoading();

  void hideLoading();
}
