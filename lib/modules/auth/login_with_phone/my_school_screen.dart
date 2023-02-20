import 'package:findmate/modules/auth/login_with_phone/your_interests_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySchoolScreen extends StatelessWidget {
  const MySchoolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarDesign(),
            Text(
              "My School Is",
              style: TextStyleClass.interBold(
                size: 28.0,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextFromFieldCommon(
                hintText: "School Name",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '''This is how it will appear in Tinder and
you will not be able to change it''',
              textAlign: TextAlign.center,
              style: TextStyleClass.interRegular(
                size: 16.0,
                color: ColorConst.grey69,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            CommonButton(
              onTap: () {
                Get.to(() => YourInterestScreen());
              },
              title: "Continue",
            ),
            const SizedBox(
              height: 184,
            ),
          ],
        ),
      ),
    );
  }
}
