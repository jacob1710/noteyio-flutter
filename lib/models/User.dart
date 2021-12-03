import 'package:firebase_core/firebase_core.dart';

class NoteyioUser{
  late String id;
  late String email;
  late String userName;
  late String firebaseId;
  NoteyioUser({required this.id,required this.email,required this.userName});

  NoteyioUser.fromJson(Map<String, dynamic> json){

    var theUser = json['user'];
    id = theUser['_id'];
    userName = theUser['userName'];
    email = theUser['email'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['firebaseId'] = this.firebaseId;
    user['email'] = this.email;
    user['userName'] = this.userName;
    return user;
  }


  @override
  String toString() {
    // TODO: implement toString
    return "ID: ${id}, Email: ${email}, userName:${userName} ";
  }
}
