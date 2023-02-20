import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<Widget> myTabs = <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        // SvgPicture.asset(ImageConst.moon, color: null),
        Icon(
          Icons.star_half_rounded,
        ),
        SizedBox(width: 7),
        Text("Zodiac"),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        // SvgPicture.asset(ImageConst.pet, color: null),
        Icon(
          Icons.pets_sharp,
        ),
        SizedBox(width: 7),
        Text("Pets"),
      ],
    ),
  ].obs;

  List<String> zodiacList = [
    "Capricorn",
    "Aquarius",
    "Pisces",
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
  ];
  List<String> petList = [
    "Cat",
    "Reptile",
    "Amphibian",
    "Don’t have but love",
    "Pet-free",
    "All the pets",
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
