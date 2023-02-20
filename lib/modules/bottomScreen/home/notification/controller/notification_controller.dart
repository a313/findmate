import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notificationList = [
    NotificationModel(title: "Hey, don’t forget to verify your email"),
    NotificationModel(title: "You have 1 Invitation"),
    NotificationModel(title: "You are tagged by John Doe in she post"),
    NotificationModel(title: "John Doe comment in your post"),
  ];
}

class NotificationModel {
  late String title;

  NotificationModel({required this.title});
}
