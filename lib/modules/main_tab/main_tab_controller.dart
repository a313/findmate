import 'package:findmate/base/base_controller.dart';
import 'package:flutter/material.dart';

class MainTabController extends BaseController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
