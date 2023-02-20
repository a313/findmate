import 'package:findmate/modules/bottomScreen/chat/controller/chat_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

///common button
// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  late String? title;
  late double? width;
  late List<Color>? colors;
  late dynamic onTap;

  CommonButton(
      {super.key, this.title, this.width, required this.onTap, this.colors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: width ?? Get.width / 1.14 /*360*/,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: colors ??
                [
                  ColorConst.appColor,
                  ColorConst.appColorFD,
                ],
          ),
        ),
        child: Text(
          title!,
          style: TextStyleClass.interSemiBold(
            size: 20.0,
            color: ColorConst.white,
          ),
        ),
      ),
    );
  }
}

///login common buttons
// ignore: must_be_immutable
class LoginCommonButtons extends StatelessWidget {
  String? image;
  String? title;
  dynamic onTap;

  LoginCommonButtons({super.key, this.image, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: MaterialButton(
        onPressed: onTap,
        height: 61,
        minWidth: Get.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(
            color: ColorConst.greyDA,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width >= 411 ? 80 : 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(image!),
              Text(
                title!,
                style: TextStyleClass.interSemiBold(
                  size: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///appbar for common
class AppBarDesign extends StatelessWidget {
  final List<Widget>? action;

  const AppBarDesign({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConst.white,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorConst.appColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      /*foregroundColor: ColorConst.appColor,*/
      automaticallyImplyLeading: false,
      actions: action,
    );
  }
}

///text from field
class TextFromFieldCommon extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isTrue;
  final TextEditingController? controller;

  const TextFromFieldCommon(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.isTrue,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      /*readOnly: isTrue ?? false,*/
      enabled: isTrue ?? true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 35, left: 20),
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
        hintText: hintText,
        hintStyle: TextStyleClass.interRegular(
          size: 16.0,
          color: ColorConst.greyB5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: ColorConst.greyEB,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: ColorConst.greyEB,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: ColorConst.appColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: ColorConst.appColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: ColorConst.appColor,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: ColorConst.greyEB,
            width: 1,
          ),
        ),
      ),
    );
  }
}

///container for post
// ignore: must_be_immutable
class PostContain extends StatelessWidget {
  double? height;
  double? width;
  Widget? child;
  Color? color;

  PostContain({super.key, this.height, this.width, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? ColorConst.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 31,
            color: ColorConst.appColorFF.withOpacity(0.25),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

///common row for profile detail
commonRowProfileD({var icon, var title}) {
  return Row(
    children: [
      Icon(
        icon,
        color: ColorConst.appColorFF,
      ),
      /*SvgPicture.asset(
                      ImageConst.uni,
                    ),*/
      const SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: TextStyleClass.interRegular(
          color: ColorConst.black,
        ),
      ),
    ],
  );
}

///common button for profile detail
// ignore: must_be_immutable
class CommonButtonProfileDetail extends StatelessWidget {
  String? image;
  String? title;

  CommonButtonProfileDetail({super.key, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 100,
      decoration: BoxDecoration(
        color: ColorConst.white,
        borderRadius: BorderRadius.circular(35.0),
        border: Border.all(
          color: ColorConst.greyE8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image!,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: TextStyleClass.interSemiBold(
              color: ColorConst.black09,
              size: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}

///bottomsheet  chat screen
bottomSheet({var image, var name, required ChatController chatController}) {
  Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.only(top: 96),
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      image,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyleClass.interSemiBold(
                                      size: 24.0,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\u2022",
                                        style: TextStyleClass.interSemiBold(
                                          size: 14.0,
                                          color: ColorConst.appColorFF,
                                        ),
                                      ),
                                      Text(
                                        "Online",
                                        style: TextStyleClass.interSemiBold(
                                          size: 14.0,
                                          color: ColorConst.greyAD,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImageConst.phone_icon),
                            const SizedBox(
                              width: 14,
                            ),
                            SvgPicture.asset(ImageConst.video_icon),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Today",
                              style: TextStyleClass.interSemiBold(
                                size: 16.0,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: chatController.messageList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment:
                            chatController.messageList[index].isEnable == true
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color:
                                  chatController.messageList[index].isEnable ==
                                          true
                                      ? ColorConst.appColorFF.withOpacity(0.08)
                                      : ColorConst.greyF4,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(15.0),
                                topRight: const Radius.circular(15.0),
                                bottomRight: chatController
                                            .messageList[index].isEnable ==
                                        true
                                    ? const Radius.circular(15.0)
                                    : const Radius.circular(0.0),
                                bottomLeft: chatController
                                            .messageList[index].isEnable ==
                                        true
                                    ? const Radius.circular(0.0)
                                    : const Radius.circular(15.0),
                              ),
                            ),
                            child: Text(
                              chatController.messageList[index].message
                                  .toString(),
                              style: TextStyleClass.interRegular(
                                color: ColorConst.black09,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment:
                                chatController.messageList[index].isEnable ==
                                        true
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                            children: [
                              Text(
                                chatController.messageList[index].time
                                    .toString(),
                                style: TextStyleClass.interRegular(
                                  color: ColorConst.greyAD,
                                ),
                              ),
                              chatController.messageList[index].isEnable != true
                                  ? SvgPicture.asset(ImageConst.double_icon)
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
            Container(
              color: ColorConst.white,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        width: Get.width,
                        padding: const EdgeInsets.only(left: 18),
                        decoration: BoxDecoration(
                          color: ColorConst.white,
                          border: Border.all(
                            color: ColorConst.greyE8,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14),
                              child: SvgPicture.asset(
                                ImageConst.add_image,
                              ),
                            ),
                            hintText: "Your message",
                            hintStyle: TextStyleClass.interRegular(
                              size: 16.0,
                              color: ColorConst.greyAD,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Container(
                      height: 48,
                      width: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorConst.white,
                        border: Border.all(
                          color: ColorConst.greyE8,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        Icons.mic_rounded,
                        color: ColorConst.appColorFF,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}

///index 0 design
Widget index0() {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: ColorConst.yellowD4,
          ),
        ),
      ),
      Container(
        height: 58,
        width: 58,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              ImageConst.photo_1,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        height: 32,
        width: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorConst.yellowD4,
          shape: BoxShape.circle,
        ),
        child: Text(
          "99+",
          style: TextStyleClass.interSemiBold(
            size: 14.0,
            color: ColorConst.white,
          ),
        ),
      ),
      Positioned(
        bottom: -6,
        child: Container(
          height: 20,
          width: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorConst.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorConst.black.withOpacity(0.25),
                offset: const Offset(0, 0),
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            Icons.favorite,
            color: ColorConst.yellowD4,
            size: 10,
          ),
        ),
      ),
    ],
  );
}

///EDIT IND=FO SCREEN TET WIDGE
editInfoText({var text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 24, bottom: 8),
    child: Text(
      text,
      style: TextStyleClass.interSemiBold(
        size: 18.0,
        color: ColorConst.black09,
      ),
    ),
  );
}

///edit info row
editInfoRow({var image, var title}) {
  return Padding(
    padding: const EdgeInsets.only(right: 24, left: 24, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              SvgPicture.asset(image),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyleClass.interSemiBold(
                  size: 16.0,
                  color: ColorConst.grey69,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Text(
                "Empty",
                style: TextStyleClass.interSemiBold(
                  size: 16.0,
                  color: ColorConst.grey69,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorConst.appColorFF,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

///edit info container
editInfoContainer({var title}) {
  return Container(
    height: 50,
    alignment: Alignment.centerLeft,
    width: Get.width,
    margin: const EdgeInsets.symmetric(horizontal: 24),
    padding: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      border: Border.all(
        color: ColorConst.greyDA,
        width: 1,
      ),
    ),
    child: Text(
      title,
      style: TextStyleClass.interSemiBold(
        size: 16.0,
        color: ColorConst.appColorFF,
      ),
    ),
  );
}

///setting screen one roe tow contenorr
rowTwo() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 86,
            width: Get.width,
            decoration: BoxDecoration(
              color: ColorConst.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.black.withOpacity(0.1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(ImageConst.boost),
                  ),
                ),
                Text(
                  "Get Boosts",
                  textAlign: TextAlign.center,
                  style: TextStyleClass.interBold(
                    size: 16.0,
                    color: ColorConst.purAA3FEC,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        Expanded(
          child: Container(
            height: 86,
            width: Get.width,
            decoration: BoxDecoration(
              color: ColorConst.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: ColorConst.black.withOpacity(0.1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
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
                    Icons.star,
                    color: ColorConst.purple,
                  ),
                ),
                Text(
                  "Get Super Likes",
                  textAlign: TextAlign.center,
                  style: TextStyleClass.interBold(
                    size: 16.0,
                    color: ColorConst.purple,
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

///doted line widget
class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight, padding;

  final Color dashColor;

  const DotWidget({
    super.key,
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.padding = 20,
    this.dashColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}
