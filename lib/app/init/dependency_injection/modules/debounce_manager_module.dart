import 'package:core/utils/debounce_manager.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DebounceManagerModule {
  @singleton
  DebounceManager createDebounceManager() {
    return DebounceManager();
  }
}
