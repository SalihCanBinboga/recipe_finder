import 'package:flutter/material.dart';

import 'screen_working_manager.dart';

class ScreenWorkingManagerImpl extends ScreenWorkingManager {
  ScreenWorkingManagerImpl();

  OverlayEntry? _overlayEntry;

  @override
  void hideLoading() {
    try {
      _overlayEntry?.remove();
    } catch (_) {
      // ignore
    } finally {
      _overlayEntry = null;
    }
  }

  @override
  void showLoading(BuildContext context) {
    if (_overlayEntry != null) {
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black12.withOpacity(.2),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }
}
