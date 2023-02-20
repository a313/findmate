import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInByEmailController extends GetxController {
  TextEditingController email = TextEditingController();
  RxString controllerText = ''.obs;
  @override
  void onInit() {
    email.addListener(() {
      controllerText.value = email.text;
    });

    debounce(controllerText, (_) {
      print("debouce$_");
    }, time: Duration(seconds: 1));
    super.onInit();
  }
}
