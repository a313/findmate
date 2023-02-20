import 'package:findmate/modules/auth/login_with_phone/controller/show_me_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/my_school_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShowMeScreen extends StatelessWidget {
  const ShowMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
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
              Get.to(() => const MySchoolScreen());
            },
            title: "Continue",
          ),
          const SizedBox(
            height: 184,
          ),
        ],
      ),
    );
  }

  Widget options() {
    return GetBuilder<ShowMeController>(
      init: ShowMeController(),
      builder: (controller) => ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.selectedItem(index);
          },
          child: Container(
            height: 50,
            width: Get.width,
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 22),
            decoration: BoxDecoration(
              color: controller.selectedIndex == index
                  ? ColorConst.appColorFF
                  : ColorConst.white,
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(
                width: 1,
                color: ColorConst.greyEB,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.title[index],
                  style: TextStyleClass.interRegular(
                    color: controller.selectedIndex == index
                        ? ColorConst.white
                        : ColorConst.black09,
                    size: 16.0,
                  ),
                ),
                SvgPicture.asset(
                  ImageConst.checkIcon,
                  color: controller.selectedIndex == index
                      ? ColorConst.white
                      : ColorConst.greyAD,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
