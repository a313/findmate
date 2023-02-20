import 'package:findmate/modules/bottomScreen/profile/subscreenlist/contaroller/setting_controller.dart';
import 'package:findmate/modules/bottomScreen/profile/subscreenlist/utiles/setting/setting_utiles.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 101,
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
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: ColorConst.appColorFF,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Settings",
                style: TextStyleClass.interSemiBold(
                  size: 20.0,
                  color: ColorConst.black09,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  firstTow(),
                  firstTow(),
                  rowTwo(),
                  const SizedBox(
                    height: 5,
                  ),
                  editInfoText(text: "Account Settings"),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Get.to(() => const PhoneEditScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 11, right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone Number",
                            style: TextStyleClass.interRegular(
                              size: 16.0,
                              color: ColorConst.black09,
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "+91 12345 67890",
                                  style: TextStyleClass.interRegular(
                                    color: ColorConst.grey69,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorConst.appColorFF,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 7, left: 24, bottom: 15),
                    child: Text(
                      "Verify a Phone Number to help secure your account.",
                      style: TextStyleClass.interSemiBold(
                        size: 14.0,
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 8),
                    child: Text(
                      "Discovery Settings",
                      style: TextStyleClass.interSemiBold(
                        size: 18.0,
                        color: ColorConst.black09,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 11, right: 24, left: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Location",
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.black09,
                          ),
                        ),
                        Text(
                          'My Current Location',
                          style: TextStyleClass.interSemiBold(
                            size: 14.0,
                            color: ColorConst.appColorFF,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 45, top: 7, bottom: 15),
                    child: Text(
                      'Change your location to see Tinder members in other cities',
                      style: TextStyleClass.interSemiBold(
                        size: 14.0,
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Maximum Distance",
                          style: TextStyleClass.interSemiBold(
                            size: 18.0,
                            color: ColorConst.appColorFF,
                          ),
                        ),
                        Text(
                          "90mi.",
                          style: TextStyleClass.interSemiBold(
                            size: 18.0,
                            color: ColorConst.black09,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, bottom: 8),
                      child: Slider(
                        value: settingController.currentSliderValue.value,
                        max: 100,
                        activeColor: ColorConst.appColorFF,
                        inactiveColor: ColorConst.greyF4,
                        label: settingController.currentSliderValue.value
                            .round()
                            .toString(),
                        onChanged: (double value) {
                          settingController.currentSliderValue.value = value;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, bottom: 15, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Only show people in this range',
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.grey69,
                          ),
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: settingController.on2.value,
                            activeColor: ColorConst.appColorFF,
                            onChanged: (val) {
                              settingController.on2.value = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      showMeBottomSheet();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 11, right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Show Me",
                            style: TextStyleClass.interRegular(
                              size: 16.0,
                              color: ColorConst.black09,
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "Women",
                                  style: TextStyleClass.interRegular(
                                    color: ColorConst.grey69,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorConst.appColorFF,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Age Range",
                          style: TextStyleClass.interSemiBold(
                            size: 18.0,
                            color: ColorConst.appColorFF,
                          ),
                        ),
                        Text(
                          "18 - 32",
                          style: TextStyleClass.interSemiBold(
                            size: 18.0,
                            color: ColorConst.black09,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, bottom: 8),
                      child: RangeSlider(
                        values: settingController.currentRangeValues.value,
                        max: 100,
                        activeColor: ColorConst.appColorFF,
                        inactiveColor: ColorConst.greyF4,
                        labels: RangeLabels(
                          settingController.currentRangeValues.value.start
                              .round()
                              .toString(),
                          settingController.currentRangeValues.value.end
                              .round()
                              .toString(),
                        ),
                        onChanged: (RangeValues values) {
                          settingController.currentRangeValues.value = values;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, bottom: 15, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Only show people in this range',
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.black09,
                          ),
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: settingController.on1.value,
                            activeColor: ColorConst.appColorFF,
                            onChanged: (val) {
                              settingController.on1.value = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 58, top: 7, bottom: 8),
                    child: Text(
                      "Tinder uses these preferences to suggest matches. Some match suggestons may not fall within your desired parameters.",
                      style: TextStyleClass.interRegular(
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, bottom: 5, top: 5, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Show me on Tinder",
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.black09,
                          ),
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: settingController.on3.value,
                            activeColor: ColorConst.appColorFF,
                            onChanged: (val) {
                              settingController.on3.value = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 58, top: 7, bottom: 8),
                    child: Text(
                      "Sharing your social content will greatly increase your chances of receiving messages!",
                      style: TextStyleClass.interRegular(
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, bottom: 5, top: 5, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Sort",
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.black09,
                          ),
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: settingController.on4.value,
                            activeColor: ColorConst.appColorFF,
                            onChanged: (val) {
                              settingController.on4.value = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 58, top: 7, bottom: 15),
                    child: Text(
                      "Turning this off will exclude your profile when your matches sort by recommended",
                      style: TextStyleClass.interRegular(
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  Container(
                    height: 46,
                    width: Get.width,
                    margin:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 15),
                    decoration: BoxDecoration(
                      color: ColorConst.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConst.black.withOpacity(0.1),
                          /*offset: Offset(0, 0),
                          spreadRadius: 0,*/
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageConst.logout),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Logout",
                          style: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.black09,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 46,
                    width: Get.width,
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 58),
                    decoration: BoxDecoration(
                      color: ColorConst.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: ColorConst.black.withOpacity(0.1),
                          /*offset: Offset(0, 0),
                          spreadRadius: 0,*/
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Text(
                      "Delete Account",
                      style: TextStyleClass.interRegular(
                        size: 16.0,
                        color: ColorConst.appColorFF,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///common first two container
firstTow() {
  return Container(
    height: 70,
    width: Get.width,
    margin: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
    decoration: BoxDecoration(
      color: ColorConst.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: ColorConst.black.withOpacity(0.1),
          /*offset: Offset(0, 0),
                          spreadRadius: 0,*/
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                ImageConst.appLogo,
              ),
              height: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "tinder",
              textAlign: TextAlign.center,
              style: TextStyleClass.interBold(
                size: 20.0,
                color: ColorConst.black09,
              ),
            ),
          ],
        ),
        Text(
          "Unlock our most exclusive features",
          textAlign: TextAlign.center,
          style: TextStyleClass.interRegular(
            size: 16.0,
            color: ColorConst.grey69,
          ),
        ),
      ],
    ),
  );
}
