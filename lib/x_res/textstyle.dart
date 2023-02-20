import 'package:flutter/material.dart';

import 'config.dart';

class TextStyleClass {
  ///SourceSansPro Regular
  static interRegular({var color, var size}) {
    return TextStyle(
      color: color ?? ColorConst.black,
      fontSize: size ?? 14.0,
      fontFamily: "SourceSansPro",
      fontWeight: FontWeight.w400,
    );
  }

  ///SourceSansPro medium
  static interSemiBold({var color, var size}) {
    return TextStyle(
      color: color ?? ColorConst.black,
      fontSize: size ?? 14.0,
      fontFamily: "SourceSansPro",
      fontWeight: FontWeight.w600,
    );
  }

  ///SourceSansPro semiBold
  static interBold({var color, var size}) {
    return TextStyle(
      color: color ?? ColorConst.black,
      fontSize: size ?? 14.0,
      fontFamily: "SourceSansPro",
      fontWeight: FontWeight.w700,
    );
  }

  ///SourceSansPro semiBold
  static arizoniaRegular({var color, var size}) {
    return TextStyle(
      color: color ?? ColorConst.black,
      fontSize: size ?? 14.0,
      fontFamily: "Arizonia",
      fontWeight: FontWeight.w400,
    );
  }

  ///SourceSansPro under line
  static interUnderLine({var size}) {
    return TextStyle(
      fontSize: size ?? 15,
      fontFamily: "SourceSansPro",
      fontWeight: FontWeight.w400,
      color: ColorConst.appColor,
      decoration: TextDecoration.underline,
      decorationColor: ColorConst.appColor,
      decorationThickness: 1,
      decorationStyle: TextDecorationStyle.solid,
    );
  }
}
