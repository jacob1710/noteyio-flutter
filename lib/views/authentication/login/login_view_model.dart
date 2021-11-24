import 'package:noteyio_flutter/models/User.dart';
import 'package:noteyio_flutter/views/basemodel.dart';

class LoginViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';

  Future<void> init() async{
    print('LoginViewModel.init');
  }
  Future<User?> loginPressed() async {
    print(currentEmail+'@'+currentPwd);
    User? optionalUser = await apiService.loginUser();
    return optionalUser;
  }
}