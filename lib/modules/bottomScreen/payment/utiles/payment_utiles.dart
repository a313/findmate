import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';

commonRow({var color, var title, var subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyleClass.interRegular(
          size: 16.0,
          color: ColorConst.grey69,
        ),
      ),
      color == null
          ? Text(
              subTitle,
              style: TextStyleClass.interRegular(
                size: 18.0,
                color: ColorConst.black09,
              ),
            )
          : Text(
              "\$10",
              style: TextStyleClass.interSemiBold(
                size: 20.0,
                color: color,
              ),
            ),
    ],
  );
}
