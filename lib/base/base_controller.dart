import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'base_common_widgets.dart';
import 'widget_state.dart';

export 'package:get/get.dart';

abstract class _ScaffoldInterface {
  Future<bool> onWillPop();
  void hideKeyboard();
}

class BaseController extends GetxController
    with _ScaffoldInterface, BaseCommonWidgets, WidgetState {
  final box = GetStorage();

  @override
  Future<bool> onWillPop() {
    if (kDebugMode) print("onPopScene");
    return Future.value(true);
  }

  @override
  void hideKeyboard() {
    if (kDebugMode) print("hideKeyboard");
    Get.focusScope?.unfocus();
  }

  @override
  void hideDialog() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
