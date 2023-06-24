import 'package:flutter/material.dart';

import 'screen_working_manager.dart';

class ScreenWorkingManagerImpl extends ScreenWorkingManager {
  ScreenWorkingManagerImpl({required super.context});

  OverlayEntry? _overlayEntry;

  @override
  void hideLoading() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void showLoading() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}
