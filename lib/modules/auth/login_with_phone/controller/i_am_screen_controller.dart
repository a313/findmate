import 'package:get/get.dart';

class IAmController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var selectedIndex;
  var monVal = false.obs;

  void selectedItem(index) {
    selectedIndex = index;
    update();
  }

  List title = ["Woman", "Man", "Choose another"];
}


