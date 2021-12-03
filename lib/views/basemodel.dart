import 'package:flutter/material.dart';
import 'package:noteyio/constants/route_names.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/services/api_service.dart';
import 'package:noteyio/services/auth_service.dart';
import 'package:noteyio/services/navigation_service.dart';
import 'package:noteyio/services/user_service.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {

  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService apiService = locator<ApiService>();
  final UserService userService = locator<UserService>();
  final AuthService authService = locator<AuthService>();


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