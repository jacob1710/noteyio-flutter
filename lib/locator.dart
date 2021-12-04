import 'package:get_it/get_it.dart';
import 'package:noteyio/services/api_service.dart';
import 'package:noteyio/services/auth_service.dart';
import 'package:noteyio/services/navigation_service.dart';
import 'package:noteyio/services/note_service.dart';
import 'package:noteyio/services/user_service.dart';
import 'package:noteyio/views/basemodel.dart';

final GetIt locator = GetIt.instance;


Future<void> setUpLocator() async {
  print("Setting Up Locator Service.");

  locator.registerFactory(() => BaseModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => NoteService());




}