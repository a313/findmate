import 'package:get/get.dart';

class ProfileDetailController extends GetxController {
  RxList selectedList = [].obs;
  List<ProfileDetailInfo> itemList = [
    ProfileDetailInfo(title: "Travelling"),
    ProfileDetailInfo(title: "Books"),
    ProfileDetailInfo(title: "Music"),
    ProfileDetailInfo(title: "Dancing"),
    ProfileDetailInfo(title: "Modeling"),
  ];
}

class ProfileDetailInfo {
  String? title;
  String? image;
  bool? isSelected;

  ProfileDetailInfo({
    this.title,
    this.isSelected,
  });
}
