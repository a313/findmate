import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:findmate/modules/bottomScreen/like/controller/like_controller.dart';
import 'package:findmate/modules/bottomScreen/like/utiles/like_utiles_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LikeScreen extends StatelessWidget {
  final LikeController likeController = Get.put(LikeController());

  LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 175,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: ColorConst.white,
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
                    "Matching",
                    style: TextStyleClass.arizoniaRegular(
                      size: 27.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
            itemCount: likeController.itemList.length,
            options: CarouselOptions(
                viewportFraction: 0.3,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(milliseconds: 1500)),
            itemBuilder: (context, index, realIdx) {
              return Container(
                child: Center(
                    child: ClipOval(
                  child: Image.asset(
                    likeController.itemList[index].image.toString(),
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                )),
              );
            },
          ),
          SIZED_BOX_H40,
          Text('Đang xếp hàng, vui lòng đợi'),
          SIZED_BOX_H40,
          InkWell(
            child: Container(
                padding: PAD_ALL16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConst.appColorFF,
                ),
                child: Text(
                  'Bắt đầu',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
    );
  }
}
