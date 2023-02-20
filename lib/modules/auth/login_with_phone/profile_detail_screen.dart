import 'package:findmate/modules/auth/login_with_phone/my_brithday_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
          Text(
            "Profile Details",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextFromFieldCommon(hintText: "First Name"),
          ),
          const SizedBox(
            height: 22,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextFromFieldCommon(hintText: "Last Name"),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '''This is how it will appear in  appname
and you will not be able to change it''',
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 16.0,
              color: ColorConst.grey69,
            ),
          ),
          const SizedBox(
            height: 214,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => const MyBirthDAyScreen());
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }
}
