import 'package:dependency_injection/device_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  debugPrint("Setup is called");
  //locator.registerSingleton<DeviceService>(DeviceService());
  // locator.registerFactory<DeviceService>(() => DeviceService());
  locator.registerLazySingleton<DeviceService>(() => DeviceService());
}
