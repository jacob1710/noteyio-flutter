import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:noteyio/models/User.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/services/auth_service.dart';

import '../locator.dart';


class ApiService{

  final AuthService? _authService =
  locator<AuthService>();


  static const String _endpoint =
    'http://10.0.2.2:3000/api'; // 'localhost' for android emulator;
  var _client = new http.Client();




  // default header
  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'testing',
    'device': 'unknown',
    'version-code': '1.0.0',
    'message-token': ''
  };


  //default timeout duration
  Duration _timeout = Duration(seconds: 60);
  Duration _smallTimeout = Duration(seconds: 5);



  Future<void> populateHeaders() async {
    //add auth
    _headers['Authorization'] = await _authService!.getAuthToken();
    // add platform
    if (Platform.isAndroid) {
      _headers['device'] = 'android';
    } else if (Platform.isIOS) {
      _headers['device'] = 'iOS';
    }
  }

  //----User Methods----

  Future<NoteyioUser?> getUser(String firebaseId) async{
    print('ApiService.getUser');
    try {
      var endpoint = Uri.parse('$_endpoint/users/get?firebaseId=$firebaseId');
      var response =
      await _client.get(endpoint, headers: _headers).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          print(response.body);
          var body = json.decode(response.body);
          print(body);
          var user = NoteyioUser.fromJson(body);
          print("Found User: " + user.toString());
          return user;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('No User Found');
        print(response.body);
        return null;
      }
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<NoteyioUser?> registerUser(Map<String, String> newUserDto) async{
    print('ApiService.registerUser');
    const String firebaseId = 'qsdgjnhsldjkgh234626';
    try {
      var endpoint = Uri.parse('$_endpoint/users/create');
      var response =
      await _client.post(endpoint, headers: _headers,body:JsonEncoder().convert(newUserDto)).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          print(response.body);
          var body = json.decode(response.body);
          print(body);
          var user = NoteyioUser.fromJson(body);
          print("Found User: " + user.toString());
          return user;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('No User Found');
        print(response.body);
      }
    } catch (e) {
      print("error");
    }
    return null;
  }

  Future<bool?> userExitsWithEmail() async{
    const String email = 'jacob@scase.co.uk';
    //REGISTER USER WITH API

    return false;
  }

//----Note Methods----

  Future<UserNoteList?> getNotesForUser(String userId) async{
    print('ApiService.getNotesForUser');
    try {
      var endpoint = Uri.parse('$_endpoint/notes/getAllForUser?userId=$userId');
      print(endpoint);
      var response =
      await _client.get(endpoint, headers: _headers).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          print(response.body);
          var body = json.decode(response.body);
          print(body);
          var notes = UserNoteList.fromJson(body);
          print('found notes: $notes');
          return notes;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('No notes Found');
        print(response.body);
        return null;
      }
    } catch (e) {
      print("error");
      return null;
    }
  }


  Future<bool?> deleteNoteWithId(String noteId) async{
    print('ApiService.getNotesForUser');
    try {
      var endpoint = Uri.parse('$_endpoint/notes/delete?noteId=$noteId');
      print(endpoint);
      var response =
      await _client.delete(endpoint, headers: _headers).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          print(response.body);
          var body = json.decode(response.body);
          print(body);
          var status = body['status'];
          if(status == 'Success'){
            return true;
          }else{
            return false;
          }
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('No note Found');
        print(response.body);
        return null;
      }
    } catch (e) {
      print("error");
      return null;
    }
  }

}