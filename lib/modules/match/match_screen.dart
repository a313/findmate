import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 53,
          ),
          Image(
            image: AssetImage(
              ImageConst.match,
            ),
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text(
                  "It’s a match, John!",
                  style: TextStyleClass.interBold(
                    color: ColorConst.appColorFF,
                    size: 34.0,
                  ),
                ),
                Text(
                  "Start a conversation now with each other",
                  style: TextStyleClass.interRegular(
                    color: ColorConst.grey69,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 73,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CommonButton(
              onTap: () {
                // Get.to(() => MatchScreen());
              },
              width: Get.width,
              title: "Say hello",
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 55,
              width: Get.width,
              margin: const EdgeInsets.only(right: 24, left: 24, top: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: ColorConst.appColorFF.withOpacity(0.1),
              ),
              child: Text(
                "Keep swiping",
                style: TextStyleClass.interRegular(
                  size: 16.0,
                  color: ColorConst.appColorFF,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
