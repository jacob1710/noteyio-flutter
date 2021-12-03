import 'package:noteyio/models/User.dart';

class UserService{

  late NoteyioUser _user;

  void setUser({required NoteyioUser user}){
    _user = user;
  }

  NoteyioUser getUser(){
    return _user;
  }
}
