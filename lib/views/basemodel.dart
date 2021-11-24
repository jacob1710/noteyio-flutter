import 'package:flutter/material.dart';
import 'package:noteyio_flutter/constants/route_names.dart';
import 'package:noteyio_flutter/models/User.dart';
import 'package:noteyio_flutter/services/api_service.dart';
import 'package:noteyio_flutter/services/navigation_service.dart';
import 'package:noteyio_flutter/services/user_service.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {

  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService apiService = locator<ApiService>();
  final UserService userService = locator<UserService>();


  //----Navigation Methods ----
  navigateToLogin(){
    _navigationService.navigateTo(AppRouteNames.kLoginViewRoute);
  }
  navigateToRegistration(){
    _navigationService.navigateTo(AppRouteNames.kRegistrationViewRoute);
  }
  navigateToHome(){
    _navigationService.navigateToWithNoBack(AppRouteNames.kHomeViewRoute);
  }
}