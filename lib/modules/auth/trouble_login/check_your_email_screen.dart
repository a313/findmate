import 'package:findmate/modules/auth/login_with_phone/my_mobile_screen.dart';
import 'package:findmate/modules/auth/trouble_login/login_by_email_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
          Text(
            "Check your email!",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          const SizedBox(
            height: 22.0,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "if we found an account with\n",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text: "Johndoe123@gmail.com\n",
                  style: TextStyleClass.interSemiBold(
                    color: ColorConst.grey69,
                    size: 18.0,
                  ),
                ),
                TextSpan(
                  text:
                      "an email has been sent. Please\ncheck your email in a moment.",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                    size: 18.0,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "Didn't receive a link?",
            style: TextStyleClass.interBold(
              color: ColorConst.grey69,
              size: 22.0,
            ),
          ),
          const SizedBox(
            height: 28.0,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => LoginByEmailScreen());
            },
            title: "Use A Different Email",
          ),
          const SizedBox(
            height: 22.0,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => const MyMobileScreen());
            },
            title: "Use Your Phone Number",
          ),
          const SizedBox(
            height: 122.0,
          ),
        ],
      ),
    );
  }
}
