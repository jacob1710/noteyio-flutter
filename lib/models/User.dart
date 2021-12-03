import 'package:firebase_core/firebase_core.dart';

class NoteyioUser{
  late String id;
  late String email;
  late String userName;
  NoteyioUser({required this.id,required this.email,required this.userName});

  NoteyioUser.fromJson(Map<String, dynamic> json){
    var theUser = json['user'];
    id = theUser['_id'];
    userName = theUser['userName'];
    email = theUser['email'];

  }


  @override
  String toString() {
    // TODO: implement toString
    return "ID: ${id}, Email: ${email}, userName:${userName} ";
  }
}
