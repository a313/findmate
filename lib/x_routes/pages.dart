import 'package:findmate/base/base_controller.dart';
import 'package:findmate/modules/main_tab/main_tab_binding.dart';
import 'package:findmate/modules/main_tab/main_tab_view.dart';
import 'package:findmate/x_routes/routes.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
          name: Routes.mainHome,
          page: () => const MainTabView(),
          binding: MainTabBinding())
    ];
  }
}
