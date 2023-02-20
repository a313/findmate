import 'package:findmate/modules/auth/trouble_login/check_your_email_screen.dart';
import 'package:findmate/modules/auth/trouble_login/controller/login_by_email_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginByEmailScreen extends StatelessWidget {
  final LogInByEmailController logInByEmailController =
      Get.put(LogInByEmailController());

  LoginByEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorConst.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarDesign(),
              Text(
                "Login by Email",
                style: TextStyleClass.interBold(
                  size: 28.0,
                ),
              ),
              const SizedBox(
                height: 33.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFromFieldCommon(
                    hintText: "Your email is",
                    controller: logInByEmailController.email),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                '''We’ll email you a link that will instantly log
you in''',
                textAlign: TextAlign.center,
                style: TextStyleClass.interRegular(
                  color: ColorConst.grey69,
                  size: 16.0,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              logInByEmailController.controllerText.isEmpty
                  ? CommonButton(
                      onTap: () {},
                      colors: [
                        ColorConst.appColor.withOpacity(0.6),
                        ColorConst.appColorFD.withOpacity(0.6),
                      ],
                      title: "Send Email",
                    )
                  : CommonButton(
                      onTap: () {
                        Get.to(() => const CheckYourEmailScreen());
                      },
                      title: "Send Email",
                    ),
              /* CommonButton(
                onTap: () {
                  Get.to(() => CheckYourEmailScreen());
                },
                title: "Send Email",
              ),*/
              const SizedBox(
                height: 185.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
