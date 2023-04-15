import 'package:flutter/material.dart' show ChangeNotifier;

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    initViewModel();
  }

  void initViewModel() {}
}
