import 'package:http/http.dart' as http;


class ApiService{
  static const String _endpoint =
    'http://10.0.2.2:8080/api/app'; // 'localhost' for android emulator;
  var _client = new http.Client();


  Future<bool> loginUser() async{
    return true;
  }
}