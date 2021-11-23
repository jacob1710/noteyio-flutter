import 'package:flutter/material.dart';
import 'package:noteyio_flutter/constants/route_names.dart';
import 'package:noteyio_flutter/services/navigation_service.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {

  final NavigationService _navigationService = locator<NavigationService>();

  navigateToLogin(){
    _navigationService.navigateToWithNoBack(AppRouteNames.kLoginViewRoute);
  }
}