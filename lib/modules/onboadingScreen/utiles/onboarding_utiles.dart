import 'package:findmate/modules/auth/login_option_screen.dart';
import 'package:findmate/modules/onboadingScreen/controller/onboarding_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///first part
// ignore: must_be_immutable
class FirstPart extends StatelessWidget {
  OnBoardingController onBoardingController;

  FirstPart({super.key, required this.onBoardingController});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onBoardingController.pageController,
      onPageChanged: onBoardingController.selectedPageIndex,
      itemCount: onBoardingController.onBoardingPages.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 11.13 /*80*/,
            ),
            Image.asset(
              onBoardingController.onBoardingPages[index].imageAsset,
              height:
                  Get.height >= 891 ? 350 : 300 /*Get.height / 2.97 */ /*300*/,
              width: Get.width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: Get.height / 19.8 /*45*/,
            ),
          ],
        );
      },
    );
  }
}

///second part
// ignore: must_be_immutable
class SecondPart extends StatelessWidget {
  OnBoardingController onBoardingController;

  SecondPart({super.key, required this.onBoardingController});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0 /*150*/,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          border: Border.all(
            color: ColorConst.greyEB,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: /* Get.height / 14.85*/ 20,
            ),
            Obx(
              () => RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: onBoardingController
                          .onBoardingPages[
                              onBoardingController.selectedPageIndex.value]
                          .title,
                      style: TextStyleClass.interSemiBold(
                        size: 28.0,
                      ),
                    ),
                    TextSpan(
                      text: onBoardingController
                          .onBoardingPages[
                              onBoardingController.selectedPageIndex.value]
                          .title2,
                      style: TextStyleClass.interSemiBold(
                        size: 28.0,
                        color: ColorConst.appColor,
                      ),
                    ),
                    TextSpan(
                      text: onBoardingController
                          .onBoardingPages[
                              onBoardingController.selectedPageIndex.value]
                          .title3,
                      style: TextStyleClass.interSemiBold(
                        size: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: /* Get.height / 14.85*/ 20,
            ),
            Row(
              children: List.generate(
                onBoardingController.onBoardingPages.length,
                (index) => Obx(
                  () {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: onBoardingController.selectedPageIndex.value ==
                                index
                            ? ColorConst.appColor
                            : ColorConst.greyD9,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: /* Get.height / 14.85*/ 20,
            ),
            Obx(
              () => TextButton(
                onPressed: () {
                  Get.offAll(() => const LogInOptionScreen());
                },
                child: Text(
                  "Skip",
                  style: TextStyleClass.interSemiBold(
                    size: 20.0,
                    color: onBoardingController.isLastPage
                        ? Colors.transparent
                        : ColorConst.appColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 49.5 /*18*/,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  onBoardingController.forwardAction();
                },
                child: const Text(
                  "Next",
                ),
              ),
            ),
            SizedBox(
              height: Get.height >= 891 ? 120 : 30,
            ),
          ],
        ),
      ),
    );
  }
}
