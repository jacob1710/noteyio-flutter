import 'dart:io';

import 'package:noteyio/views/basemodel.dart';

class IndividualNoteViewModel extends BaseModel{


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

  Future<void> init() async{
    await populateHeaders();
  }

}