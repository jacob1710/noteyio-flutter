import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/views/basemodel.dart';

class IntroViewModel extends BaseModel{

  Future init({required BuildContext context}) async {
    print('IntroViewModel.init');
    try {
      bool isLogged = await isUserLoggedIn();
      if (isLogged) {
        print("loogged in");
        User? firebaseUser = await authService.getUser();
        print("successful");
        NoteyioUser? optionalUser;
        if(firebaseUser != null){
          optionalUser = await apiService.getUser(firebaseUser.uid);
          userService.setUser(user: optionalUser!);
          navigateToHome();
        }
      }else{

      }
    }
    catch (exception){
      print(exception);
    }
  }

  getStarted(){
    print('Clicked Get Started');
  }

}