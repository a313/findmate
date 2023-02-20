import 'package:findmate/modules/bottomScreen/chat/controller/chat_controller.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    "YourApp",
                    style: TextStyleClass.arizoniaRegular(
                      size: 27.0,
                    ),
                  ),
                ),
                Container(
                  height: 44,
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: ColorConst.greyF4,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: ColorConst.greyF4,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: ColorConst.appColorFF,
                        size: 20,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyleClass.interRegular(
                        size: 16.0,
                        color: ColorConst.grey69,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "New Matches",
                        style: TextStyleClass.interSemiBold(
                          size: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 88,
                        width: Get.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: chatController.imageList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index == 0
                                    ? index0()
                                    : Container(
                                        height: 58,
                                        width: 58,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              chatController
                                                  .imageList[index].image
                                                  .toString(),
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                Text(
                                  chatController.imageList[index].name
                                      .toString(),
                                  style: TextStyleClass.interSemiBold(
                                    size: 16.0,
                                    color: ColorConst.black09,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Messages",
                        style: TextStyleClass.interSemiBold(
                          size: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      messagesList(),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///message list
  Widget messagesList() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(right: 24),
      itemCount: chatController.imageListForChat.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              bottomSheet(
                  image:
                      chatController.imageListForChat[index].image.toString(),
                  name: chatController.imageListForChat[index].name.toString(),
                  chatController: chatController);
            },
            child: SizedBox(
              height: 48,
              width: Get.width,
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
                                chatController.imageListForChat[index].image
                                    .toString(),
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
                              chatController.imageListForChat[index].name
                                  .toString(),
                              style: TextStyleClass.interSemiBold(
                                size: 16.0,
                              ),
                            ),
                            Text(
                              chatController.imageListForChat[index].subtitle
                                  .toString(),
                              style: TextStyleClass.interRegular(
                                size: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chatController.imageListForChat[index].time.toString(),
                        style: TextStyleClass.interRegular(
                          size: 12.0,
                          color: ColorConst.greyAD,
                        ),
                      ),
                      (index == 0 || index == 1)
                          ? Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConst.appColorFF,
                              ),
                              child: Text(
                                "1",
                                style: TextStyleClass.interSemiBold(
                                  size: 12.0,
                                  color: ColorConst.white,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
