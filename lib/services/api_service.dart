import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:noteyio/models/NewNoteDto.dart';
import 'package:noteyio/models/Note.dart';
import 'package:noteyio/models/SearchQueryDto.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/models/UserNoteList.dart';
import 'package:noteyio/services/auth_service.dart';

import '../locator.dart';


class ApiService{

  final AuthService? _authService =
  locator<AuthService>();

  final uploader = FlutterUploader();


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
    await populateHeaders();
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
    await populateHeaders();
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
    await populateHeaders();
    try {
      var endpoint = Uri.parse('$_endpoint/notes/getAllForUser?userId=$userId');
      print(endpoint);
      var response =
      await _client.get(endpoint, headers: _headers).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          var body = json.decode(response.body);
          var notes = UserNoteList.fromJson(body);
          return notes;
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('No notes Found');
        return null;
      }
    } catch (e) {
      print("error");
      return null;
    }
  }


  Future<bool?> deleteNoteWithId(String noteId) async{
    print('ApiService.deleteNoteWithId');
    await populateHeaders();
    try {
      var endpoint = Uri.parse('$_endpoint/notes/delete?noteId=$noteId');
      print(endpoint);
      var response =
      await _client.delete(endpoint, headers: _headers).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          var body = json.decode(response.body);
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
        return null;
      }
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<Note?> createNewNote (NewNoteDto newNoteDto) async{
    print('ApiService.createNewNote');
    await populateHeaders();
    try {
      var endpoint = Uri.parse('$_endpoint/notes/create');
      print(endpoint);
      var response =
      await _client.post(endpoint, headers: _headers,body: JsonEncoder().convert(newNoteDto)).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          var body = json.decode(response.body);
          var note = Note.fromJson(body['note']);
          return note;
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

  Future<bool?> uploadImageToNote(File image, String noteId) async {
    print('ApiService.uploadImageToNote');
    var endpoint = Uri.parse('$_endpoint/notes/addPhotoToNote');
    print(endpoint);
    try{
      var request = http.MultipartRequest('POST',endpoint);
      request.files.add(
          http.MultipartFile.fromBytes(
              'photo',
              image.readAsBytesSync(),
              filename: noteId
          )
      );
      request.fields['name'] = noteId;
      request.fields['noteId'] = noteId;
      var resAsStream = await request.send();
      var response = await http.Response.fromStream(resAsStream);
      if(response.statusCode == 200){
        try {
          var body = json.decode(response.body);
          var note = Note.fromJson(body['note']);
          return true;
        } catch (e) {
          print(e.toString());
        }
      }else{
        return null;
      }
    }catch(e){
      print('error');
      return null;
    }

  }


  Future<UserNoteList?> searchForNote (SearchQueryDto searchQueryDto) async{
    print('ApiService.searchForNote');
    print('search query is: ${searchQueryDto.searchQuery}');
    await populateHeaders();
    try {
      var endpoint = Uri.parse('$_endpoint/notes/search');
      print(endpoint);
      var response =
      await _client.post(endpoint, headers: _headers,body: JsonEncoder().convert(searchQueryDto)).timeout(_smallTimeout);
      if (response.statusCode == 200) {
        try {
          var body = json.decode(response.body);
          var notes = UserNoteList.fromJson(body);
          return notes;
        } catch (e) {
          print(e.toString());
          return UserNoteList(notes: []);
        }
      } else {
        print('No note Found');
        print(response.body);
        return UserNoteList(notes: []);
      }
    } catch (e) {
      print("error");
      return UserNoteList(notes: []);
    }
  }

}