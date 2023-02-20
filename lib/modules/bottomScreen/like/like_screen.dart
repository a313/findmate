import 'dart:ui';

import 'package:findmate/modules/bottomScreen/like/controller/like_controller.dart';
import 'package:findmate/modules/bottomScreen/like/utiles/like_utiles_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LikeScreen extends StatelessWidget {
  final LikeController likeController = Get.put(LikeController());

  LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 175,
            width: Get.width,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: ColorConst.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  color: ColorConst.black.withOpacity(0.15),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: ColorConst.white,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        ImageConst.appLogo,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(
                    "YourApp",
                    style: TextStyleClass.arizoniaRegular(
                      size: 27.0,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: Get.width,
                  padding: const EdgeInsets.only(
                      bottom: 9, top: 9, right: 14, left: 14),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: ColorConst.greyE8,
                    ),
                  ),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              likeController.isScreen(false);
                            },
                            color: likeController.isScreen.isFalse
                                ? ColorConst.appColorFF
                                : ColorConst.greyF2,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "4 Likes",
                              style: TextStyleClass.interBold(
                                size: 16.0,
                                color: likeController.isScreen.isFalse
                                    ? ColorConst.white
                                    : ColorConst.black03,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              if (likeController.isSelected.isFalse) {
                                return;
                              } else {
                                likeController.isScreen(true);
                              }
                            },
                            color: likeController.isScreen.isTrue
                                ? ColorConst.appColorFF
                                : ColorConst.greyF2,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Top Picks",
                              style: TextStyleClass.interBold(
                                size: 16.0,
                                color: likeController.isScreen.isTrue
                                    ? ColorConst.white
                                    : ColorConst.black03,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => likeController.isSelected.isFalse
                ? BottomPart1(likeController: likeController)
                : BottomPart2(likeController: likeController),
          ),
        ],
      ),
    );
  }
}

///bottompart
class BottomPart1 extends StatelessWidget {
  final LikeController likeController;

  const BottomPart1({super.key, required this.likeController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 11,
            ),
            Text(
              '''Upgrade to Gold to see people
who have already liked you.''',
              textAlign: TextAlign.center,
              style: TextStyleClass.interRegular(
                size: 18.0,
                color: ColorConst.grey69,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: likeController.itemList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.4,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 23),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showAlert(
                          context: context, likeController: likeController);
                    },
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            likeController.itemList[index].image.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            color: Colors.grey.withOpacity(0.1),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 16),
                              child: SvgPicture.asset(ImageConst.menu),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: CommonButton(
                onTap: () {
                  // Get.to(() => EnableLocationScreen());
                },
                width: Get.width,
                title: "SEE WHO LIKES YOU",
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomPart2 extends StatelessWidget {
  final LikeController likeController;

  const BottomPart2({super.key, required this.likeController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 11,
            ),
            Obx(
              () => Text(
                likeController.isScreen.isTrue
                    ? '''Upgrade to Tinder Gold for
more Top Picks!'''
                    : '''Upgrade to Gold to see people
who have already liked you.''',
                textAlign: TextAlign.center,
                style: TextStyleClass.interRegular(
                  size: 18.0,
                  color: ColorConst.grey69,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: likeController.itemList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.4,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 23),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      /*  showAlert(
                          context: context, likeController: likeController);*/
                    },
                    child: Container(
                      constraints: const BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            likeController.itemList[index].image.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          // alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            image: DecorationImage(
                              image: AssetImage(ImageConst.blur_bg),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 14),
                              child: likeController.isScreen.isTrue
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            margin: const EdgeInsets.only(
                                                top: 6, right: 6),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorConst.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ColorConst.appColorFF
                                                      .withOpacity(0.25),
                                                  blurRadius: 31,
                                                  offset: const Offset(0, 4),
                                                )
                                              ],
                                            ),
                                            child: Icon(
                                              Icons.star,
                                              color: ColorConst.purple,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Rex, 27",
                                              style:
                                                  TextStyleClass.interSemiBold(
                                                size: 22.0,
                                                color: ColorConst.white,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "\u2022 ",
                                                  style: TextStyleClass
                                                      .interSemiBold(
                                                    size: 14.0,
                                                    color: ColorConst.green,
                                                  ),
                                                ),
                                                Text(
                                                  "Recently Active",
                                                  style: TextStyleClass
                                                      .interSemiBold(
                                                    size: 14.0,
                                                    color: ColorConst.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "Rex, 27",
                                        style: TextStyleClass.interSemiBold(
                                          size: 22.0,
                                          color: ColorConst.white,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              child: Obx(
                () => CommonButton(
                  onTap: () {
                    // Get.to(() => EnableLocationScreen());
                  },
                  width: Get.width,
                  title: likeController.isScreen.isTrue
                      ? "UNLOCK TOP PICKS"
                      : "SEE WHO LIKES YOU",
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
