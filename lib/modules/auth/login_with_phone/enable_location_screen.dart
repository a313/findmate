import 'package:findmate/base/base_controller.dart';
import 'package:findmate/modules/bottomScreen/home/bottomNavigation/bottom_navigation_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        children: [
          const AppBarDesign(),
          Text(
            "Enable Location",
            style: TextStyleClass.interBold(
              size: 28.0,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            '''You’ll need to enable your
location in order to use
Appname''',
            textAlign: TextAlign.center,
            style: TextStyleClass.interRegular(
              size: 16.0,
              color: ColorConst.grey69,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: Image(
              image: AssetImage(ImageConst.map),
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 53),
            child: CommonButton(
              width: Get.width,
              onTap: () {
                Get.to(() => BottomNavigation());
              },
              title: "Allow Location",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tell Me More",
                textAlign: TextAlign.center,
                style: TextStyleClass.interRegular(
                  size: 20.0,
                  color: ColorConst.grey69,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: ColorConst.grey69,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
