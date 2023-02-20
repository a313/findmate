import 'package:findmate/x_res/res.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<ChatImageList> imageList = [
    ChatImageList(image: ImageConst.photo_1, name: "Likes"),
    ChatImageList(image: ImageConst.photo_2, name: "Emma"),
    ChatImageList(image: ImageConst.photo_3, name: "Ava"),
    ChatImageList(image: ImageConst.photo_4, name: "Sophia"),
    ChatImageList(image: ImageConst.photo_1, name: "Amelia"),
    ChatImageList(image: ImageConst.photo_3, name: "Ava"),
    ChatImageList(image: ImageConst.photo_4, name: "Sophia"),
    ChatImageList(image: ImageConst.photo_1, name: "Amelia"),
  ];
  List<ChatImageList> messageList = [
    ChatImageList(
      message:
          "Hi John, how are you? I saw on the\napp that we’ve crossed paths several\ntimes this week 😄",
      time: "2:55 PM",
      isEnable: true,
    ),
    ChatImageList(
      message:
          "Haha truly! Nice to meet you Rex!\nWhat about a cup of coffee today\nevening? ☕️ ",
      time: "2:55 PM",
      isEnable: false,
    ),
    ChatImageList(
      message: "Sure, let’s do it! 😊",
      time: "2:55 PM",
      isEnable: true,
    ),
    ChatImageList(
      message:
          "Great I will write later the exact\ntime and place. See you soon!",
      time: "2:55 PM",
      isEnable: false,
    ),
    ChatImageList(
      message: "Sure, let’s do it! 😊",
      time: "2:55 PM",
      isEnable: true,
    ),
    ChatImageList(
      message:
          "Great I will write later the exact\ntime and place. See you soon!",
      time: "2:55 PM",
      isEnable: false,
    ),
    ChatImageList(
      message:
          "Hi John, how are you? I saw on the\napp that we’ve crossed paths several\ntimes this week 😄",
      time: "2:55 PM",
      isEnable: true,
    ),
  ];

  List<ChatImageList> imageListForChat = [
    ChatImageList(
      image: ImageConst.girl3,
      name: "Emelie",
      subtitle: "Sticker 😍",
      time: "23 min",
    ),
    ChatImageList(
      image: ImageConst.girl4,
      name: "Abigail",
      subtitle: "Typing..",
      time: "27 min",
    ),
    ChatImageList(
      image: ImageConst.gril2without,
      name: "Elizabeth",
      subtitle: "Ok, see you then.",
      time: "33 min",
    ),
    ChatImageList(
      image: ImageConst.gril1Without,
      name: "Penelope",
      subtitle: "You: Hey! What’s up, long time..",
      time: "50 min",
    ),
    ChatImageList(
      image: ImageConst.photo_2,
      name: "Chloe",
      subtitle: "You: Hello how are you?",
      time: "55 min",
    ),
    ChatImageList(
      image: ImageConst.photo_3,
      name: "Grace",
      subtitle: "You: Great I will write later..",
      time: "1 hour",
    ),
  ];
}

class ChatImageList {
  String? image;
  String? name;
  String? subtitle;
  String? time;
  String? message;
  bool? isEnable;

  ChatImageList(
      {this.image,
      this.name,
      this.subtitle,
      this.time,
      this.message,
      this.isEnable});
}
