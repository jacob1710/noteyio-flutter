import 'package:noteyio_flutter/models/User.dart';

class UserService{
  late User _user;

  void setUser({required User user}){
    _user = user;
  }

  User getUser(){
    return _user;
  }
}
