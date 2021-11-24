import 'package:flutter/material.dart';
import 'package:noteyio_flutter/constants/route_names.dart';
import 'package:noteyio_flutter/views/authentication/login/login_view.dart';
import 'package:noteyio_flutter/views/authentication/registration/registration_view.dart';
import 'package:noteyio_flutter/views/home/home_view.dart';
import 'package:noteyio_flutter/views/home/home_view_model.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print("Router Accessed.");

  switch (settings.name) {
    case AppRouteNames.kLoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case AppRouteNames.kRegistrationViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RegistrationView(),
      );

    case AppRouteNames.kHomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
