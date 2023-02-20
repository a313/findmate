import 'package:findmate/base/base_controller.dart';
import 'package:findmate/modules/bottomScreen/profile/subscreenlist/edit_profile_screen.dart';
import 'package:findmate/modules/bottomScreen/profile/subscreenlist/setting_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///profile part1
class ProfilePart1 extends StatelessWidget {
  const ProfilePart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height / 2,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConst.edit_bg,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(
                      ImageConst.appLogo,
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "YourApp",
                  style: TextStyleClass.arizoniaRegular(
                    size: 27.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 152,
                    width: 152,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(ImageConst.men1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          ColorConst.appColor,
                          ColorConst.appColorFD,
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: ColorConst.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "John Doe",
                  style: TextStyleClass.interBold(
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -60,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorConst.appColor,
                      ColorConst.appColorFD,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add_a_photo,
                  size: 30,
                  color: ColorConst.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Add media",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                    color: ColorConst.grey69,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -15,
          left: 39,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => SettingScreen());
                },
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: ColorConst.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConst.appColorFF.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 31,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.settings,
                    size: 30,
                    color: ColorConst.grey69,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Settings",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                    color: ColorConst.grey69,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -15,
          right: 39,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: ColorConst.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConst.appColorFF.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 31,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 30,
                    color: ColorConst.grey69,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Edit info",
                  style: TextStyleClass.interRegular(
                    size: 18.0,
                    color: ColorConst.grey69,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
