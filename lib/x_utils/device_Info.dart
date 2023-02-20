import 'package:client_information/client_information.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';

class DeviceInfo {
  factory DeviceInfo() => _instance ??= DeviceInfo._();

  String deviceId = "";
  String deviceName = "";
  String appVersion = "";
  String osVersion = "";
  bool isSocialEnable = false;

  DeviceInfo._();

  static DeviceInfo? _instance;

  Future<void> getDeviceInfo() async {
    try {
      ClientInformation.fetch().then((info) => handleClientInfo(info));
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get client information');
      }
    }
  }

  Future<void> handleClientInfo(ClientInformation clientInfo) async {
    deviceId = clientInfo.deviceId;
    osVersion = clientInfo.osVersion;
    deviceName = clientInfo.deviceName;
    getAppVersion();
  }

  Future<void> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = correctAppVersion(packageInfo.version);
  }

  String correctAppVersion(String versionRaw) {
    final version = versionRaw.split("-")[0];
    return version;
  }
}
