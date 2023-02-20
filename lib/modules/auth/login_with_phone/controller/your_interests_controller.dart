import 'package:findmate/x_res/res.dart';
import 'package:get/get.dart';

class YourInterestsController extends GetxController {
  RxList selectedList = [].obs;
  List<InterestsInfo> itemList = [
    InterestsInfo(title: "Photography", image: ImageConst.camera),
    InterestsInfo(title: "Shopping", image: ImageConst.bag),
    InterestsInfo(title: "Karaoke", image: ImageConst.microPhone),
    InterestsInfo(title: "Yoga", image: ImageConst.yoga),
    InterestsInfo(title: "Cooking", image: ImageConst.cooking),
    InterestsInfo(title: "Tennis", image: ImageConst.tennis),
    InterestsInfo(title: "Run", image: ImageConst.run),
    InterestsInfo(title: "Swimming", image: ImageConst.swimming),
    InterestsInfo(title: "Art", image: ImageConst.art),
    InterestsInfo(title: "Traveling", image: ImageConst.traveling),
    InterestsInfo(title: "Extreme", image: ImageConst.extreme),
    InterestsInfo(title: "Music", image: ImageConst.music),
    InterestsInfo(title: "Drink", image: ImageConst.drink),
    InterestsInfo(title: "Video games", image: ImageConst.videoGame),
  ];
  List<InterestsInfo> itemListInterest = [
    InterestsInfo(title: "Photography", image: ImageConst.camera),
    InterestsInfo(title: "Shopping", image: ImageConst.bag),
    InterestsInfo(title: "Karaoke", image: ImageConst.microPhone),
    InterestsInfo(title: "Yoga", image: ImageConst.yoga),
    InterestsInfo(title: "Cooking", image: ImageConst.cooking),
    InterestsInfo(title: "Tennis", image: ImageConst.tennis),
    InterestsInfo(title: "Run", image: ImageConst.run),
    InterestsInfo(title: "Swimming", image: ImageConst.swimming),
    InterestsInfo(title: "Art", image: ImageConst.art),
    InterestsInfo(title: "Traveling", image: ImageConst.traveling),
    InterestsInfo(title: "Extreme", image: ImageConst.extreme),
    InterestsInfo(title: "Music", image: ImageConst.music),
    InterestsInfo(title: "Drink", image: ImageConst.drink),
    InterestsInfo(title: "Video games", image: ImageConst.videoGame),
    InterestsInfo(title: "Photography", image: ImageConst.camera),
    InterestsInfo(title: "Shopping", image: ImageConst.bag),
    InterestsInfo(title: "Karaoke", image: ImageConst.microPhone),
    InterestsInfo(title: "Yoga", image: ImageConst.yoga),
    InterestsInfo(title: "Cooking", image: ImageConst.cooking),
    InterestsInfo(title: "Tennis", image: ImageConst.tennis),
    InterestsInfo(title: "Run", image: ImageConst.run),
    InterestsInfo(title: "Swimming", image: ImageConst.swimming),
    InterestsInfo(title: "Art", image: ImageConst.art),
    InterestsInfo(title: "Traveling", image: ImageConst.traveling),
  ];
}

class InterestsInfo {
  String? title;
  String? image;

  InterestsInfo({this.title, this.image});
}
