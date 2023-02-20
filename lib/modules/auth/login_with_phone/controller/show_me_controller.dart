import 'package:get/get.dart';

class ShowMeController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var selectedIndex;

  void selectedItem(index) {
    selectedIndex = index;
    update();
  }

  List title = ["Woman", "Man", "Everyone"];
}
