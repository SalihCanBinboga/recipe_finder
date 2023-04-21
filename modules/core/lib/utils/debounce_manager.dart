/*
 *
 *  * debounce_manager.dart
 *  * Created by Salih Can Binboga on 13/04/2023.
 *
 */

import 'dart:async';
import 'dart:ui';

class DebounceManager {
  DebounceManager({
    this.milliseconds = 500,
    this.maxPendingEvent,
  }) {
    _duration = Duration(milliseconds: milliseconds);
  }

  final int milliseconds;
  final int? maxPendingEvent;
  Timer? _timer;
  int _pendingEventCount = 0;

  late final Duration _duration;

  void run(VoidCallback action) {
    if (maxPendingEvent != null && _pendingEventCount >= maxPendingEvent!) {
      _timer?.cancel();
      _pendingEventCount = 0;
      action();
    } else {
      _timer?.cancel();
      _timer = Timer(_duration, () {
        _pendingEventCount = 0;
        action();
      });
      _pendingEventCount++;
    }
  }
}
