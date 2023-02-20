import 'package:findmate/x_res/enums.dart';
import 'package:flutter/material.dart';

import 'base_controller.dart';

///
/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especialy in user interactions.
/// You can find and use on your Controller wich is the Controller extends [BaseController].

abstract class _CommonWidgetsInterface {
  void showProgressingDialog();
  void showSnackBar(String message, {SnackBarType type = SnackBarType.error});
  void showAlertDialog(Widget dialog,
      {bool dismissable = true, Function onCompleted});
  void bottomSheet(Widget bottomSheet);
  void hideDialog();
}

class BaseCommonWidgets implements _CommonWidgetsInterface {
  @override
  void hideDialog() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  @override
  void showProgressingDialog() {
    Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0)),
                child: const CircularProgressIndicator()),
          ),
        ),
        barrierDismissible: false,
        name: "ProgressingDialog");
  }

  @override
  void showSnackBar(String message,
      {SnackBarType type = SnackBarType.error,
      SnackPosition position = SnackPosition.TOP}) {
    Color color;
    Color bgColor;
    switch (type) {
      case SnackBarType.info:
        color = const Color(0XFF2F80ED);
        bgColor = const Color(0XFFD5E6FB);
        break;
      case SnackBarType.success:
        color = const Color(0XFF2EB872);
        bgColor = const Color(0XFFC2F0D9);
        break;
      case SnackBarType.error:
        color = const Color(0XFFF46666);
        bgColor = const Color(0XFFFCD1D1);
        break;
      case SnackBarType.warning:
        color = const Color(0XFFE6AB3A);
        bgColor = const Color(0XFFFFECC6);
        break;
    }

    final bar = GetSnackBar(
      messageText: Text(
        message,
        style: TextStyle(
          color: color,
          fontFamily: 'iCielHelveticaNowText',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      icon: const Icon(
        Icons.info,
        color: Colors.white,
      ),
      snackPosition: position,
      backgroundColor: bgColor,
      padding: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );

    Get.showSnackbar(bar);
  }

  @override
  void bottomSheet(Widget bottomSheet) {
    Get.bottomSheet(bottomSheet, useRootNavigator: true);
  }

  @override
  void showAlertDialog(
    Widget dialog, {
    bool dismissable = true,
    Function? onCompleted,
  }) {
    Get.dialog(dialog, barrierDismissible: dismissable)
        .whenComplete(() => onCompleted?.call());
  }
}
