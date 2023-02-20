import 'package:findmate/modules/auth/login_option_screen.dart';
import 'package:findmate/modules/onboadingScreen/model/onboarding_info.dart';
import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offAll(() => const LogInOptionScreen());
      //go to home page
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        ImageConst.onBoarding1, 'Find people who ', 'match', "\nwith you"),
    OnBoardingInfo(ImageConst.onBoarding2, 'Easily ', 'message & call the',
        "\npeople you like"),
    OnBoardingInfo(ImageConst.onBoarding3,
        'Don’t wait anymore, find\nout your ', 'soul mate ', "now")
  ];

  List onBoardingPages1 = [
    "Be a top profile in your area for\n30 minutes to get more matches",
    "Be a top profile in your area for\n30 minutes to get more matches",
    "Be a top profile in your area for\n30 minutes to get more matches",
    "Be a top profile in your area for\n30 minutes to get more matches",
    "Be a top profile in your area for\n30 minutes to get more matches",
  ];
}
