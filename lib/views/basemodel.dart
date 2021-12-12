import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:noteyio/constants/route_names.dart';
import 'package:noteyio/models/Note.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/services/api_service.dart';
import 'package:noteyio/services/auth_service.dart';
import 'package:noteyio/services/navigation_service.dart';
import 'package:noteyio/services/note_service.dart';
import 'package:noteyio/services/user_service.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {

  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService apiService = locator<ApiService>();
  final UserService userService = locator<UserService>();
  final AuthService authService = locator<AuthService>();
  final NoteService noteService = locator<NoteService>();

  UserNoteList? userNoteList;

  Future<bool> isUserLoggedIn() async {
    return authService.isUserLoggedIn();
  }

  void logoutUser() {
    authService.logout();
    navigateToIntro();
  }

  void backgroundHandler() {
    // Needed so that plugin communication works.
    WidgetsFlutterBinding.ensureInitialized();

    // This uploader instance works within the isolate only.
    FlutterUploader uploader = FlutterUploader();

    // You have now access to:
    uploader.progress.listen((progress) {
      // upload progress
    });
    uploader.result.listen((result) {
      // upload results
    });
  }

  Future<void> showErrorDialog(BuildContext context, String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Accept'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


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
  navigateToIntro(){
    _navigationService.navigateToWithNoBack(AppRouteNames.kIntroViewRoute);
  }
  navigateToIndividualNoteView(Note note){
    _navigationService.navigateTo(AppRouteNames.kIndividualNoteViewRoute,arguments: note);
  }
  navigateToCreateNoteView(VoidCallback refresh){
    _navigationService.navigateTo(AppRouteNames.kCreateNoteViewRoute, arguments: refresh);
  }
  navigateToSearchView(String search){
    _navigationService.navigateTo(AppRouteNames.kSearchViewRoute, arguments: search);
  }

  //API FOR VIEWING IMAGE
  //BAD CODE TO HAVE ENDPOINT HERE BUT NO OTHER WAY
  String imageApiEndpoint = 'http://10.0.2.2:3000/api/photo/get/';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'testing',
    'device': 'unknown',
    'version-code': '1.0.0',
    'message-token': ''
  };

  Future<void> populateHeaders() async {
    //add auth
    headers['Authorization'] = await authService.getAuthToken();
    // add platform
    if (Platform.isAndroid) {
      headers['device'] = 'android';
    } else if (Platform.isIOS) {
      headers['device'] = 'iOS';
    }
  }
}