import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxService {
  var currentSliderValue = 20.0.obs;
  RxBool on1 = false.obs;
  RxBool on2 = false.obs;
  RxBool on3 = false.obs;
  RxBool on4 = false.obs;
  Rx<RangeValues> currentRangeValues = RangeValues(0, 20).obs;
}
