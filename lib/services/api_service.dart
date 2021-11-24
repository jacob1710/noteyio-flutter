import 'package:http/http.dart' as http;
import 'package:noteyio_flutter/models/User.dart';


class ApiService{
  static const String _endpoint =
    'http://10.0.2.2:8080/api/app'; // 'localhost' for android emulator;
  var _client = new http.Client();


  //----User Methods----
  Future<User?> loginUser() async{
    const String userId = '618bf5e632156c69279d30c';
    const String email = 'jacob@scase.co.uk';
    const String userName = 'jacob';

    //Validate User

    User user = new User(id: userId, email: email, userName: userName);
    return user;
  }

  Future<User?> registerUser() async{
    const String userId = '618bf5e632156c69279d30c';
    const String email = 'jacob@scase.co.uk';
    const String userName = 'jacob';

    //REGISTER USER WITH API

    User user = new User(id: userId, email: email, userName: userName);
    return user;
  }

//----Note Methods----
}