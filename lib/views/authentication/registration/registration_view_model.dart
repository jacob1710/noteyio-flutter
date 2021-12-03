import 'package:noteyio/models/User.dart';
import 'package:noteyio/views/basemodel.dart';

class RegistrationViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';
  String currentUserName = '';

  Future<void> init() async{
    print('RegistrationViewModel.init');
  }

  Future<User?> registerPressed() async{
    print('RegistrationViewModel.registerPressed');


    final status = await authService.signUpWithEmail(
      email: currentEmail,
      pass: currentPwd,
    );
    print(status);


    User? optionalUser = await apiService.registerUser();
    return optionalUser;
  }

}