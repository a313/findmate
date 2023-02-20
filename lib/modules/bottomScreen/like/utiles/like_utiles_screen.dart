import 'package:findmate/modules/bottomScreen/like/controller/like_controller.dart';
import 'package:findmate/modules/bottomScreen/payment/pay_card_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAlert(
    {required BuildContext context, LikeController? likeController}) {
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Get.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 21,
                ),
                Text(
                  "Get Tinder Gold",
                  style: TextStyleClass.interBold(
                    size: 22.0,
                    color: ColorConst.appColorFF,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: 57,
                  width: 57,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        ColorConst.appColorFE,
                        ColorConst.appColorFF,
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: ColorConst.white,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  height: 60,
                  child: PageView.builder(
                    controller: onBoardingController.pageController,
                    onPageChanged: onBoardingController.selectedPageIndex,
                    itemCount: onBoardingController.onBoardingPages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Unlimited Likes",
                              style: TextStyleClass.interSemiBold(
                                size: 18.0,
                                color: ColorConst.black,
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              "Send as many likes as you want",
                              style: TextStyleClass.interRegular(
                                size: 12.0,
                                color: ColorConst.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingController.onBoardingPages.length,
                    (index) => Obx(() {
                      return Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: onBoardingController
                                          .selectedPageIndex.value ==
                                      index
                                  ? Colors.transparent
                                  : ColorConst.greyC0),
                          color: onBoardingController.selectedPageIndex.value ==
                                  index
                              ? ColorConst.appColor
                              : ColorConst.white,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                SizedBox(
                  height: 145,
                  child: GetBuilder<OnBoardingController>(
                    init: OnBoardingController(),
                    builder: (controller) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.primeInfo.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.selectedItem(index);
                          },
                          child: Container(
                            height: 145,
                            width: Get.width / 3.45,
                            decoration: BoxDecoration(
                              color: ColorConst.greyF7,
                              border: Border.all(
                                color: controller.selectedIndex == index
                                    ? ColorConst.appColorFF
                                    : ColorConst.greyDE,
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 19,
                                ),
                                Text(
                                  controller.primeInfo[index].image.toString(),
                                  style: TextStyleClass.interBold(
                                    size: 25.0,
                                    color: controller.selectedIndex == index
                                        ? ColorConst.appColorFF
                                        : ColorConst.black,
                                  ),
                                ),
                                Text(
                                  controller.primeInfo[index].title.toString(),
                                  style: TextStyleClass.interBold(
                                    size: 15.0,
                                    color: controller.selectedIndex == index
                                        ? ColorConst.appColorFF
                                        : ColorConst.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  controller.primeInfo[index].subTitle
                                      .toString(),
                                  style: TextStyleClass.interBold(
                                    size: 15.0,
                                    color: controller.selectedIndex == index
                                        ? ColorConst.appColorFF
                                        : ColorConst.black,
                                  ),
                                ),
                                if (index == 1)
                                  const SizedBox(
                                    height: 15,
                                  ),
                                if (index == 1)
                                  Text(
                                    "Save 36%",
                                    style: TextStyleClass.interBold(
                                      size: 11.0,
                                      color: controller.selectedIndex == index
                                          ? ColorConst.appColorFF
                                          : ColorConst.black,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CommonButton(
                    onTap: () {
                      Get.back();
                      likeController!.isSelected(true);
                      Get.to(() => PaymentVaiCardScreen());
                    },
                    width: Get.width,
                    title: "CONTINUE",
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
              ],
            ),
          ),
        ],
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 27),
    ),
  );
}

commonContainerDialog() {
  return Container(
    height: 10,
    width: 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: ColorConst.greyC0,
        width: 0.7,
      ),
    ),
  );
}

commonContainerDialog2({var child}) {
  return Container(
    height: 145,
    width: Get.width / 3.5,
    decoration: BoxDecoration(
      color: ColorConst.greyF7,
      border: Border.all(
        color: ColorConst.greyDE,
      ),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 19,
        ),
        Text(
          "12",
          style: TextStyleClass.interBold(
            size: 25.0,
            color: ColorConst.black,
          ),
        ),
        Text(
          "months",
          style: TextStyleClass.interBold(
            size: 15.0,
            color: ColorConst.black,
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Text(
          "\$7/mo",
          style: TextStyleClass.interBold(
            size: 15.0,
            color: ColorConst.black,
          ),
        ),
      ],
    ),
  );
}
