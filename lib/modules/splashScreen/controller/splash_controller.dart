import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:findmate/modules/onboadingScreen/onboading_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SplashMainController extends GetxController {
  @override
  void onInit() {
    // checkUserConnection();
    Timer(
      const Duration(seconds: 5),
      () {
        Get.off(() => OnBoardingScreen());
      },
    );
    super.onInit();
  }

  var activeConnection = false.obs;
  var T = "".obs;

  ///check internet
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection(true);
        T.value = "Turn off the data and repress again";
        log("  ON INTERNET    ${T.value}");
      }
    } on SocketException catch (_) {
      activeConnection(false);
      T.value = "Turn On the data and repress again";
      Fluttertoast.showToast(
          msg: "Please check ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: ColorConst.black,
          textColor: ColorConst.white,
          fontSize: 20.0);
      log("  ON INTERNET    ${T.value}");
    }
  }
}
