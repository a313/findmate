import 'package:findmate/base/base_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/i_am_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBirthDAyScreen extends StatelessWidget {
  const MyBirthDAyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
          Text(
            "My Birthday Is",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFromFieldCommon(
              hintText: "MM/DD/YYYY",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  ImageConst.calander,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Your age will be public",
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 16.0,
              color: ColorConst.grey69,
            ),
          ),
          const SizedBox(
            height: 310,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => IAmScreen());
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }
}
