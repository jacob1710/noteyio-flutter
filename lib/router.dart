import 'package:flutter/material.dart';
import 'package:noteyio/constants/route_names.dart';
import 'package:noteyio/models/Note.dart';
import 'package:noteyio/views/authentication/intro_view.dart';
import 'package:noteyio/views/authentication/login/login_view.dart';
import 'package:noteyio/views/authentication/registration/registration_view.dart';
import 'package:noteyio/views/home/home_view.dart';
import 'package:noteyio/views/home/home_view_model.dart';
import 'package:noteyio/views/note_creation/create_note_view.dart';
import 'package:noteyio/views/note_viewing/individual_note_view.dart';
import 'package:noteyio/views/search/note_search_view.dart';

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
    case AppRouteNames.kIntroViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: IntroView(),
      );

    case AppRouteNames.kCreateNoteViewRoute:
      VoidCallback refresh = settings.arguments as VoidCallback;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateNoteView(refresh: refresh),
      );

    case AppRouteNames.kIndividualNoteViewRoute:
      Note note = settings.arguments as Note;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: IndividualNoteView(note: note),
      );
    case AppRouteNames.kSearchViewRoute:
      String searchTerm = settings.arguments as String;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NoteSearchView(searchTerm: searchTerm),
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
