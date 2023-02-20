import 'package:findmate/modules/bottomScreen/home/notification/controller/notification_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController notificationController =
      Get.put(NotificationController());

  NotificationScreen({super.key});

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
                "Notification",
                style: TextStyleClass.interSemiBold(
                  size: 20.0,
                  color: ColorConst.black09,
                ),
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            shrinkWrap: true,
            itemCount: notificationController.notificationList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 168,
                width: Get.width,
                padding: const EdgeInsets.only(right: 28, left: 30, top: 22),
                decoration: BoxDecoration(
                  color: (index == 0 || index == 1)
                      ? ColorConst.appColorFF.withOpacity(0.05)
                      : ColorConst.white,
                  border: Border(
                    bottom: BorderSide(
                      color: ColorConst.greyEB,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (index == 0 || index == 1)
                        ? Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  image: AssetImage(ImageConst.men1),
                                  height: 28,
                                  width: 28,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                right: -5,
                                top: -5,
                                child: Container(
                                  height: 15,
                                  width: 14,
                                  decoration: BoxDecoration(
                                    color: ColorConst.appColorFF,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: AssetImage(ImageConst.gril1Without),
                              height: 28,
                              width: 28,
                              fit: BoxFit.fill,
                            ),
                          ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5h ago",
                            style: TextStyleClass.interRegular(
                              size: 12.0,
                              color: ColorConst.grey6B,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: Text(
                              notificationController
                                  .notificationList[index].title,
                              style: TextStyleClass.interRegular(
                                size: 16.0,
                                color: ColorConst.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do...",
                              /*maxLines: 2,
                              overflow: TextOverflow.ellipsis,*/
                              style: TextStyleClass.interRegular(
                                size: 12.0,
                                color: ColorConst.grey6B,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
