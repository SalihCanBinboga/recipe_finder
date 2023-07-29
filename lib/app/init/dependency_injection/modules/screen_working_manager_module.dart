import 'package:core/widget/screen_working_manager/screen_working_manager.dart';
import 'package:core/widget/screen_working_manager/screen_working_manager_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ScreenWorkingManagerModule {
  @singleton
  ScreenWorkingManager createWorkingManager() {
    return ScreenWorkingManagerImpl();
  }
}
