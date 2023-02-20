import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_tab_controller.dart';

class MainTabView extends GetView<MainTabController> {
  const MainTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Love"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "User"),
            ],
            onTap: (index) {
              controller.tabController.index = index;
            }),
        body: TabBarView(
          controller: controller.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: ColorConst.appColor,
            ),
            Container(
              color: ColorConst.appColorFD,
            ),
            Container(
              color: ColorConst.appColorFE,
            ),
            Container(
              color: ColorConst.appColorFF,
            ),
          ],
        ),
      ),
    );
  }
}
