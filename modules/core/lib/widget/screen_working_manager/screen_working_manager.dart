import 'package:flutter/material.dart' show BuildContext;

abstract class ScreenWorkingManager {
  ScreenWorkingManager();

  void showLoading(BuildContext context);

  void hideLoading();
}
