import 'package:findmate/base/base_controller.dart';
import 'package:findmate/modules/main_tab/main_tab_controller.dart';

class MainTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainTabController());
  }
}
