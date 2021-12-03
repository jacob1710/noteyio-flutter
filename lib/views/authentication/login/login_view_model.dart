import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteyio/models/User.dart';
import 'package:noteyio/views/basemodel.dart';

class LoginViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';

  Future<void> init() async{
    print('LoginViewModel.init');
  }
  Future<NoteyioUser?> loginPressed() async {
    print(currentEmail+'@'+currentPwd);

    final status = await authService.loginWithEmail(
        email: currentEmail, pass: currentPwd);
    NoteyioUser? optionalUser;
    print(status);
    if(status == "successful"){
      User? firebaseUser = await authService.getUser();
      print("successful");
      if(firebaseUser != null){
        optionalUser = await apiService.getUser(firebaseUser.uid);
      }
    }else{
      print("error");
    }
    return optionalUser;
  }
}