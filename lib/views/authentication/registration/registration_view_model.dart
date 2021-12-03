import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/views/basemodel.dart';

class RegistrationViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';
  String currentUserName = '';

  Future<void> init() async{
    print('RegistrationViewModel.init');
  }

  Future<NoteyioUser?> registerPressed() async{
    print('RegistrationViewModel.registerPressed');


    final status = await authService.signUpWithEmail(
      email: currentEmail,
      pass: currentPwd,
    );
    NoteyioUser? optionalUser;
    if(status == "successful"){
      print("successful");
      User? firebaseUser = await authService.getUser();
      print("successful");
      if(firebaseUser != null){
        Map<String, String> newUserDto = {
          "userName": currentUserName,
          "email": currentEmail,
          "firebaseId": firebaseUser.uid
        };
        optionalUser = await apiService.registerUser(newUserDto);
      }

    }else{
      //Error
      print(status);
    }

    return optionalUser;
  }

}