import 'package:get_it/get_it.dart';
import 'package:noteyio_flutter/services/api_service.dart';
import 'package:noteyio_flutter/services/navigation_service.dart';
import 'package:noteyio_flutter/views/basemodel.dart';

final GetIt locator = GetIt.instance;


Future<void> setUpLocator() async {
  print("Setting Up Locator Service.");

  locator.registerFactory(() => BaseModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());



}