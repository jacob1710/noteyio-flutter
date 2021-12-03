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
      print(authService.getUser());
      optionalUser = await apiService.registerUser();
    }else{
      //Error
      print(status);
    }

    return optionalUser;
  }

}