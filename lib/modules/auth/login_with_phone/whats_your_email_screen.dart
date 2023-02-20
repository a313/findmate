import 'package:findmate/modules/auth/login_with_phone/profile_detail_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsYourEmailScreen extends StatelessWidget {
  const WhatsYourEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarDesign(),
            Text(
              "What’s your email?",
              style: TextStyleClass.interBold(
                size: 28.0,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              '''Don’t  lose access to your account,
verify your email.''',
              textAlign: TextAlign.center,
              style: TextStyleClass.interRegular(
                size: 16.0,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextFromFieldCommon(hintText: "Enter Email"),
            ),
            const SizedBox(
              height: 240,
            ),
            CommonButton(
              onTap: () {
                Get.to(() => const ProfileDetailScreen());
              },
              title: "Continue",
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              "Or",
              style: TextStyleClass.interBold(
                size: 15.0,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            LoginCommonButtons(
              onTap: () {},
              image: ImageConst.googleSvg,
              title: "Login With Google",
            ),
            const SizedBox(
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}
