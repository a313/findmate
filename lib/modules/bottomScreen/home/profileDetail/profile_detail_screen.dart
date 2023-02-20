import 'package:findmate/modules/bottomScreen/home/profileDetail/controller/profile_detail_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileDetailHomeScreen extends StatelessWidget {
  final ProfileDetailController profileDetailController =
      Get.put(ProfileDetailController());

  ProfileDetailHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: 480,
                width: Get.width,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ImageConst.gril1Without,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorConst.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomDesign(),
        ],
      ),
    );
  }

  Widget bottomDesign() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: Get.height / 2,
          width: Get.width,
          decoration: BoxDecoration(
            color: ColorConst.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rex, 27",
                    style: TextStyleClass.interBold(
                      color: ColorConst.black,
                      size: 26.0,
                    ),
                  ),
                  Text(
                    "Proffesional model",
                    style: TextStyleClass.interRegular(
                      color: ColorConst.black,
                      size: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  commonRowProfileD(
                    title: "Veer Narmad South Gujarat University",
                    icon: Icons.school_outlined,
                  ),
                  commonRowProfileD(
                    title: "Live in Surat",
                    icon: Icons.home_outlined,
                  ),
                  commonRowProfileD(
                    title: "3 miles away",
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "About",
                    style: TextStyleClass.interSemiBold(
                      color: ColorConst.black,
                      size: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    children: [
                      CommonButtonProfileDetail(
                        title: "Dancing",
                        image: ImageConst.dance,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CommonButtonProfileDetail(
                        title: "Modeling",
                        image: ImageConst.modeling,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Interests",
                    style: TextStyleClass.interSemiBold(
                      color: ColorConst.black,
                      size: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: profileDetailController.itemList.length,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2 / 0.65,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return (index == 0 || index == 1)
                            ? Container(
                                /*alignment: Alignment.center,*/
                                decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(
                                    color: ColorConst.appColorFF,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(ImageConst.doubleClick),
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      profileDetailController
                                          .itemList[index].title
                                          .toString(),
                                      style: TextStyleClass.interSemiBold(
                                        color: ColorConst.appColorFF,
                                        size: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(
                                    color: ColorConst.greyE8,
                                  ),
                                ),
                                child: Text(
                                  profileDetailController.itemList[index].title
                                      .toString(),
                                  style: TextStyleClass.interRegular(
                                    color: ColorConst.black09,
                                    size: 14.0,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PostContain(
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SvgPicture.asset(ImageConst.cancel),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              PostContain(
                height: 88,
                width: 88,
                color: ColorConst.appColorFF,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SvgPicture.asset(
                    ImageConst.heart,
                    color: ColorConst.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              PostContain(
                height: 70,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: SvgPicture.asset(ImageConst.star),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
