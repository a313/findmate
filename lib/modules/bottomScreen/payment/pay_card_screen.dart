import 'package:findmate/modules/bottomScreen/payment/controller/payment_controller.dart';
import 'package:findmate/modules/bottomScreen/payment/pay_google_screen.dart';
import 'package:findmate/modules/bottomScreen/payment/utiles/payment_utiles.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentVaiCardScreen extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());

  PaymentVaiCardScreen({super.key});

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
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFromFieldCommon(hintText: "Card Number"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                    child: TextFromFieldCommon(hintText: "Cardholder Name"),
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24, bottom: 20),
                          child: TextFromFieldCommon(hintText: "MM/YY"),
                        ),
                      ),
                      SizedBox(width: 11),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20, right: 24),
                          child: TextFromFieldCommon(hintText: "CVC"),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 20),
                    child: TextFromFieldCommon(hintText: "ZIP Code"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 12),
                    child: TextFromFieldCommon(hintText: "Email Address"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: paymentController.monVal.value,
                          onChanged: (val) {
                            paymentController.monVal.value = val!;
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          activeColor: ColorConst.appColorFF,
                          // fillColor: ColorConst.appColorFF,
                        ),
                      ),
                      Text(
                        "Save this card for future purchases",
                        style: TextStyleClass.interRegular(
                          color: ColorConst.grey69,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DotWidget(
                    dashColor: Colors.black.withOpacity(0.16),
                    totalWidth: Get.width,
                    dashHeight: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30, left: 30, top: 13, bottom: 13),
                    child: Column(
                      children: [
                        commonRow(
                            title: "Tinder Gold 6 months:", subTitle: "\$10"),
                        const SizedBox(
                          height: 10,
                        ),
                        commonRow(title: "Tax:", subTitle: "\$5"),
                        const SizedBox(
                          height: 10,
                        ),
                        commonRow(
                          title: "Total:",
                          subTitle: "\$15",
                          color: ColorConst.appColorFF,
                        ),
                      ],
                    ),
                  ),
                  DotWidget(
                    dashColor: Colors.black.withOpacity(0.16),
                    totalWidth: Get.width,
                    dashHeight: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 13, left: 24, right: 24, bottom: 19),
                    child: Text(
                      "By tapping buy now, we will charge your card, your subscription will automatically renew for the same package length at the same price until you cancel in account Settings, and you agree to our Terms.",
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
                          // cancel: true,
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                padding: const EdgeInsets.only(bottom: 10),
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
                          radius: 15,
                        );
                      },
                      title: "Buy Now",
                      width: Get.width,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const PayVaiGooglePayScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 9, bottom: 40),
                      child: Text(
                        "Buy with Google Play instead",
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
            ),
          ),
        ],
      ),
    );
  }
}
