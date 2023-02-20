import 'package:dotted_border/dotted_border.dart';
import 'package:findmate/modules/auth/login_with_phone/controller/add_photos_controller.dart';
import 'package:findmate/modules/bottomScreen/profile/subscreenlist/utiles/editprofile/edit_profile_utiles.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final AddPhotosController addPhotosController =
      Get.put(AddPhotosController());

  EditProfileScreen({super.key});

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
                "Edit info",
                style: TextStyleClass.interSemiBold(
                  size: 20.0,
                  color: ColorConst.black09,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 9,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2 / 2.5,
                                crossAxisSpacing: 11,
                                mainAxisSpacing: 9),
                        itemBuilder: (context, index) {
                          return ((index == 0 || index == 1))
                              ? Container(
                                  height: 142,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        index == 0
                                            ? ImageConst.men1
                                            : ImageConst.men2,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      margin: const EdgeInsets.only(
                                          right: 5, top: 5),
                                      decoration: const BoxDecoration(
                                        color: Colors.black45,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        color: ColorConst.appColorFF,
                                      ),
                                    ),
                                  ),
                                )
                              : DottedBorder(
                                  padding: EdgeInsets.zero,
                                  borderType: BorderType.RRect,
                                  color: ColorConst.appColorFF,
                                  radius: const Radius.circular(12),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    child: Container(
                                      height: 142,
                                      width: Get.width,
                                      color: ColorConst.appColorFD
                                          .withOpacity(0.2),
                                      child: Padding(
                                        padding: const EdgeInsets.all(34),
                                        child: FloatingActionButton(
                                          heroTag: "Text",
                                          backgroundColor:
                                              ColorConst.appColorFD,
                                          elevation: 0.0,
                                          onPressed: () {
                                            addPhotosController.selected.value =
                                                !addPhotosController
                                                    .selected.value;
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: ColorConst.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        '''Add a video, pic or Loop to get 4% closer
to completing your profile and you may
even get more Likes.''',
                        textAlign: TextAlign.center,
                        style: TextStyleClass.interRegular(
                          size: 18.0,
                          color: ColorConst.grey69,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CommonButton(
                        onTap: () {
                          // Get.to(() => AccountRecoveryScreen());
                        },
                        width: Get.width,
                        title: "Add Media",
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    editInfoText(text: "Photo Options"),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Smart Photos",
                            style: TextStyleClass.interRegular(
                              size: 18.0,
                              color: ColorConst.grey69,
                            ),
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              value: addPhotosController.on.value,
                              activeColor: ColorConst.appColorFF,
                              onChanged: (val) {
                                addPhotosController.on.value = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "Smart Photos continuously tests all your profile photos to find the best one.",
                        style: TextStyleClass.interRegular(
                          size: 18.0,
                          color: ColorConst.grey69,
                        ),
                      ),
                    ),
                    editInfoText(text: "About Me"),
                    Container(
                      height: 91,
                      margin: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 15),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: ColorConst.greyDA,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        maxLength: 500,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "About me",
                          hintStyle: TextStyleClass.interRegular(
                            size: 16.0,
                            color: ColorConst.greyB5,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        interestBottomSheet();
                      },
                      child: editInfoText(text: "Interests"),
                    ),
                    const Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                      child: Text(
                        "Sports, Fashion, Gym, Motorcycling,Photography",
                        style: TextStyleClass.interRegular(
                          size: 18.0,
                          color: ColorConst.grey69,
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        lifestyleBottomSheet();
                      },
                      child: editInfoText(text: "Lifestyle"),
                    ),
                    const Divider(),
                    editInfoRow(image: ImageConst.moon, title: "Zodiac"),
                    editInfoRow(image: ImageConst.pet, title: "Pets"),
                    const Divider(),
                    editInfoText(text: "Job Title"),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextFromFieldCommon(hintText: "Add Job Title"),
                    ),
                    editInfoText(text: "Company"),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextFromFieldCommon(hintText: "Add Company"),
                    ),
                    editInfoText(text: "School"),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextFromFieldCommon(hintText: "Add School"),
                    ),
                    editInfoText(text: "Living In"),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextFromFieldCommon(hintText: "Add City"),
                    ),
                    editInfoText(text: "Show my Instagram Photos"),
                    editInfoContainer(title: "Connect Instagram"),
                    editInfoText(text: "My Top Spotify Artists"),
                    editInfoContainer(title: "Add Spotify to Your Profile"),
                    InkWell(
                      onTap: () {
                        iAmBottomSheet();
                      },
                      child: editInfoText(text: "I Am"),
                    ),
                    const Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 24, bottom: 12),
                      child: Text(
                        "Man",
                        style: TextStyleClass.interRegular(
                          size: 16.0,
                          color: ColorConst.grey69,
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        orientationBottomSheet();
                      },
                      child: editInfoText(text: "Sexual Orientation"),
                    ),
                    const Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 24, bottom: 12),
                      child: Text(
                        "Straight",
                        style: TextStyleClass.interRegular(
                          size: 16.0,
                          color: ColorConst.grey69,
                        ),
                      ),
                    ),
                    const Divider(),
                    editInfoText(text: "Control Your Profile"),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Don’t Show My Age",
                            style: TextStyleClass.interRegular(
                              size: 18.0,
                              color: ColorConst.grey69,
                            ),
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              value: addPhotosController.on1.value,
                              activeColor: ColorConst.appColorFF,
                              onChanged: (val) {
                                addPhotosController.on1.value = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Don’t Show My Distance",
                            style: TextStyleClass.interRegular(
                              size: 18.0,
                              color: ColorConst.grey69,
                            ),
                          ),
                          Obx(
                            () => CupertinoSwitch(
                              value: addPhotosController.on2.value,
                              activeColor: ColorConst.appColorFF,
                              onChanged: (val) {
                                addPhotosController.on2.value = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 52,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
