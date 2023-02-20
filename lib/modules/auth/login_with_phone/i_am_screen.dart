import 'package:findmate/base/base_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/controller/i_am_screen_controller.dart';
import 'package:findmate/modules/auth/login_with_phone/my_orientation_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IAmScreen extends StatelessWidget {
  final IAmController iAmController = Get.put(IAmController());

  IAmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
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
              Text(
                "Show my gender on my profile",
                style: TextStyleClass.interRegular(
                  color: ColorConst.grey69,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 164,
          ),
          CommonButton(
            onTap: () {
              Get.to(() => const MyOrientationScreen());
            },
            title: "Continue",
          ),
        ],
      ),
    );
  }
}

Widget options() {
  return GetBuilder<IAmController>(
    init: IAmController(),
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
