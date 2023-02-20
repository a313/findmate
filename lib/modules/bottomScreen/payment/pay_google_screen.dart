import 'package:findmate/modules/bottomScreen/payment/pay_card_screen.dart';
import 'package:findmate/modules/bottomScreen/payment/utiles/payment_utiles.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayVaiGooglePayScreen extends StatelessWidget {
  const PayVaiGooglePayScreen({Key? key}) : super(key: key);

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
                "Payment Method",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 70, left: 83, top: 85, bottom: 98),
                    child: Image(
                      image: AssetImage(ImageConst.banner),
                    ),
                  ),
                  Column(
                    children: [
                      DotWidget(
                        dashColor: Colors.black.withOpacity(0.16),
                        totalWidth: Get.width,
                        dashHeight: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10),
                        child: commonRow(
                            title: "Tinder Gold 6 months:", subTitle: "\$5"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 12),
                        child: commonRow(
                          title: "Total:",
                          subTitle: "\$5",
                          color: ColorConst.appColorFF,
                        ),
                      ),
                      DotWidget(
                        dashColor: Colors.black.withOpacity(0.16),
                        totalWidth: Get.width,
                        dashHeight: 1,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 13, bottom: 19),
                        child: Text(
                          "By tapping buy now you agree to our Terms.",
                          textAlign: TextAlign.center,
                          style: TextStyleClass.interRegular(
                            color: ColorConst.grey69,
                            size: 12.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CommonButton(
                          onTap: () {
                            Get.defaultDialog(
                                title: "",
                                titleStyle: const TextStyle(fontSize: 0.0),
                                titlePadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                barrierDismissible: false,
                                content: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(Icons.close),
                                      ),
                                    ),
                                    Image(
                                      image: AssetImage(ImageConst.success),
                                      height: 150,
                                      width: Get.width,
                                    ),
                                    Text(
                                      "Success",
                                      style: TextStyleClass.interBold(
                                        color: ColorConst.black09,
                                        size: 42.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Your Plan Activated Successfully",
                                        style: TextStyleClass.interRegular(
                                          color: ColorConst.black09,
                                          size: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                radius: 15);
                          },
                          title: "Buy Now",
                          width: Get.width,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(PaymentVaiCardScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 9, bottom: 40),
                          child: Text(
                            "Buy with Credit or Debit Card instead",
                            textAlign: TextAlign.center,
                            style: TextStyleClass.interSemiBold(
                              color: ColorConst.appColorFF,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
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
