import 'package:findmate/modules/auth/login_with_phone/controller/i_am_screen_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/i_am_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PhoneEditScreen extends StatelessWidget {
  const PhoneEditScreen({Key? key}) : super(key: key);

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
                "Phone Number Settings",
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
                  editInfoText(text: "Phone Number"),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextFromFieldCommon(
                      hintText: "91 12345 67890",
                      isTrue: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          ImageConst.checkIcon,
                          color: ColorConst.appColorFF,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 7, bottom: 24),
                    child: Text(
                      "Verified Phone Number",
                      style: TextStyleClass.interRegular(
                        color: ColorConst.grey69,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const UpdateMobileScreen());
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        border: Border.all(color: ColorConst.greyEB),
                      ),
                      child: Text(
                        "Update My Phone Number",
                        style: TextStyleClass.interSemiBold(
                          size: 16.0,
                          color: ColorConst.appColorFF,
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
    );
  }
}

///show me bottom sheet
showMeBottomSheet() {
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
              "Show Me",
              style: TextStyleClass.interBold(
                size: 28.0,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            options(),
            const Spacer(),
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

///update mobile screen
class UpdateMobileScreen extends StatelessWidget {
  const UpdateMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
          Text(
            "My Number Is",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          mobileTextFrom(),
          const SizedBox(
            height: 16,
          ),
          Text(
            "When you tap continue, appname will send a text with\nverification code. Message and data rates may apply.\nThe verified phone number can be used to login.",
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 13.0,
              color: ColorConst.grey69,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Learn what happens when your number changes.",
            textAlign: TextAlign.center,
            style: TextStyleClass.interUnderLine(size: 13.0),
          ),
          const Spacer(),
          CommonButton(
            onTap: () {
              Get.to(() => UpdateVerifyScreen());
            },
            title: "Continue",
          ),
          const SizedBox(
            height: 185.0,
          ),
        ],
      ),
    );
  }

  Widget mobileTextFrom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      ImageConst.india,
                    ),
                  ),
                  Text(
                    " (+91)",
                    style: TextStyleClass.interRegular(
                      size: 16.0,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorConst.greyAD,
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: VerticalDivider(
                      color: ColorConst.greyE8,
                    ),
                  ),
                ],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 35, left: 20),
          hintText: "12345 67890",
          hintStyle: TextStyleClass.interSemiBold(
            size: 16.0,
            color: ColorConst.black03,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.greyEB,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.greyEB,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.appColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.appColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.appColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: ColorConst.greyEB,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

///update verify otp screen
class UpdateVerifyScreen extends StatelessWidget {
  UpdateVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
          Text(
            "Verify it’s you",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "We send a code to ",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text: "(+91 12345 67890).\n",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                    color: ColorConst.appColor,
                  ),
                ),
                TextSpan(
                  text: "Enter it here to verify your identity.",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            onCompleted: (val) {
              // Get.to(() => WhatsYourEmailScreen());
            },
          ),
          const SizedBox(
            height: 42,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Send again",
              style: TextStyleClass.interBold(
                size: 18.0,
                color: ColorConst.appColorFF,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 66,
    height: 67,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorConst.greyE8,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 66,
    height: 67,
    /*textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),*/
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorConst.appColor,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final submittedPinTheme = PinTheme(
    width: 66,
    height: 67,
    textStyle: TextStyleClass.interSemiBold(
      size: 34.0,
      color: ColorConst.white,
    ),
    decoration: BoxDecoration(
      color: ColorConst.appColorFF,
      border: Border.all(
        color: ColorConst.appColorFF,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
