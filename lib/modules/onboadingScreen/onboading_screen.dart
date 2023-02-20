import 'package:findmate/modules/onboadingScreen/controller/onboarding_controller.dart';
import 'package:findmate/modules/onboadingScreen/utiles/onboarding_utiles.dart';
import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          FirstPart(onBoardingController: onBoardingController),
          SecondPart(onBoardingController: onBoardingController),
        ],
      ),
    );
  }
}
