import 'package:device_friendly_name/device_friendly_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DeviceService {
  DeviceService() {
    debugPrint("DeviceService singleton instance has been created.");
  }

  final _deviceFriendlyNamePlugin = DeviceFriendlyName();

  Future<String> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _deviceFriendlyNamePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String deviceName;
    try {
      deviceName = await _deviceFriendlyNamePlugin.getDeviceFriendlyName() ??
          'Unknown device name';
    } on PlatformException {
      deviceName = 'Failed to get device name';
    }

    return "PlatformVersion: $platformVersion.\nDeviceName: $deviceName.";
  }
}
