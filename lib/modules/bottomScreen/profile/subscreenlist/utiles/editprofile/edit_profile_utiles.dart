import 'package:findmate/modules/auth/login_with_phone/controller/i_am_screen_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/controller/my_orientation_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/controller/your_interests_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/i_am_screen.dart';
import 'package:findmate/modules/auth/login_with_phone/utiles/orientation_utiles.dart';
import 'package:findmate/modules/auth/login_with_phone/utiles/your_interest_utiles.dart';
import 'package:findmate/modules/bottomScreen/profile/subscreenlist/contaroller/edit_profile_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///interest bottom sheet
interestBottomSheet() {
  final YourInterestsController yourInterestsController =
      Get.put(YourInterestsController());
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(top: 96),
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Interests",
                    style: TextStyleClass.interBold(
                      size: 28.0,
                      color: ColorConst.black09,
                    ),
                  ),
                  Text(
                    "5 of 5",
                    style: TextStyleClass.interRegular(
                      size: 16.0,
                      color: ColorConst.grey69,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: ColorConst.greyF4,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                        color: ColorConst.greyF4,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: ColorConst.appColorFF,
                          size: 20,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyleClass.interRegular(
                          size: 16.0,
                          color: ColorConst.grey69,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount:
                          yourInterestsController.itemListInterest.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 0.65,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return GridItem(
                          item: yourInterestsController.itemListInterest[index],
                          isSelected: (bool value) {
                            if (value) {
                              if (yourInterestsController.selectedList.length !=
                                  5) {
                                yourInterestsController.selectedList.add(
                                    yourInterestsController
                                        .itemListInterest[index]);
                              }
                            } else {
                              yourInterestsController.selectedList.remove(
                                  yourInterestsController
                                      .itemListInterest[index]);
                            }

                            print("$index : $value");
                          },
                          selectedLength:
                              yourInterestsController.selectedList.length,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
            Container(
              height: 111,
              width: Get.width,
              padding: const EdgeInsets.only(
                  top: 16, bottom: 40, left: 24, right: 24),
              decoration: BoxDecoration(
                color: ColorConst.white,
                border: Border.all(
                  color: ColorConst.greyEB,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
              ),
              child: CommonButton(
                onTap: () {
                  // Get.to(() => AddPhotosScreen());
                },
                title: "Done",
              ),
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}

///life style bottom sheet
lifestyleBottomSheet() {
  final EditProfileTabController editProfileTabController =
      Get.put(EditProfileTabController());
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(top: 96),
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.only(
                  top: 42, right: 24, left: 24, bottom: 24),
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: ColorConst.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: ColorConst.greyE8)),
              child: TabBar(
                tabs: editProfileTabController.myTabs,
                unselectedLabelColor: ColorConst.grey69,
                labelStyle: TextStyleClass.interRegular(
                  size: 16.0,
                  color: ColorConst.white,
                ),
                unselectedLabelStyle: TextStyleClass.interRegular(
                  size: 16.0,
                  color: ColorConst.grey69,
                ),
                labelColor: ColorConst.white,
                controller: editProfileTabController.controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorConst.appColorFF,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: TabBarView(
                  controller: editProfileTabController.controller,
                  children: [
                    Zodiac(),
                    Pets(), /* CancelledBooking()*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}

class Zodiac extends StatelessWidget {
  final EditProfileTabController editProfileTabController =
      Get.put(EditProfileTabController());

  Zodiac({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "What’s your zodiac sign?",
          style: TextStyleClass.interBold(
            size: 16.0,
            color: ColorConst.black,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: MultiSelectChip(
            editProfileTabController.zodiacList,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyleClass.interSemiBold(
              size: 17.0,
              color: ColorConst.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CommonButton(
          onTap: () {
            // Get.to(() => AddPhotosScreen());
          },
          title: "Done",
        ),
        const SizedBox(
          height: 44,
        ),
      ],
    );
  }
}

class Pets extends StatelessWidget {
  final EditProfileTabController editProfileTabController =
      Get.put(EditProfileTabController());

  Pets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Do you have any pets?",
          style: TextStyleClass.interBold(
            size: 16.0,
            color: ColorConst.black,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: MultiSelectChip(
            editProfileTabController.petList,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyleClass.interSemiBold(
              size: 17.0,
              color: ColorConst.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CommonButton(
          onTap: () {
            // Get.to(() => AddPhotosScreen());
          },
          title: "Done",
        ),
        const SizedBox(
          height: 44,
        ),
      ],
    );
  }
}

///i am bottom sheet
iAmBottomSheet() {
  final IAmController iAmController = Get.put(IAmController());
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(top: 96),
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "I am a",
              style: TextStyleClass.interBold(
                size: 28.0,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            options(),
            const Divider(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Checkbox(
                    value: iAmController.monVal.value,
                    onChanged: (val) {
                      iAmController.monVal.value = val!;
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    activeColor: ColorConst.appColorFF,
                    // fillColor: ColorConst.appColorFF,
                  ),
                ),
                /*  Text(
                  "Show my gender on my profile",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                  ),
                ),*/
                Text(
                  "Show my gender on my profile",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                  ),
                ),
              ],
            ),
            CommonButton(
              onTap: () {
                // Get.to(() => MyOrientationScreen());
              },
              title: "Done",
            ),
            const SizedBox(
              height: 44,
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}

/// Sexual Orientation bottom sheet
orientationBottomSheet() {
  final MyOrientationController myOrientationController =
      Get.put(MyOrientationController());
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(top: 96),
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Sexual Orientation",
              style: TextStyleClass.interBold(
                size: 28.0,
              ),
            ),
            /* SizedBox(
              height: 11,
            ),*/
            Text(
              "Select up t o 3",
              textAlign: TextAlign.center,
              style: TextStyleClass.interRegular(
                size: 16.0,
                color: ColorConst.grey69,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: MultiSelectChip(
                myOrientationController.reportList,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Checkbox(
                    value: myOrientationController.monVal.value,
                    onChanged: (val) {
                      myOrientationController.monVal.value = val!;
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    activeColor: ColorConst.appColorFF,
                    // fillColor: ColorConst.appColorFF,
                  ),
                ),
                Text(
                  "Show my gender on my profile",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                  ),
                ),
              ],
            ),
            CommonButton(
              onTap: () {
                // Get.to(() => ShowMeScreen());
              },
              title: "Done",
            ),
            const SizedBox(
              height: 44,
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
