import 'package:noteyio/models/User.dart';
import 'package:noteyio/views/basemodel.dart';

class LoginViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';

  Future<void> init() async{
    print('LoginViewModel.init');
  }
  Future<User?> loginPressed() async {
    print(currentEmail+'@'+currentPwd);

    final status = await authService.loginWithEmail(
        email: currentEmail, pass: currentPwd);
    print(status);
    if(status == "success"){
      print("success");
      print(authService.getUser());
    }

    User? optionalUser = await apiService.loginUser();
    return optionalUser;
  }
}