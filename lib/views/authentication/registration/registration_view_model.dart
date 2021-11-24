import 'package:noteyio_flutter/models/User.dart';
import 'package:noteyio_flutter/views/basemodel.dart';

class RegistrationViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';
  String currentUserName = '';

  Future<void> init() async{
    print('RegistrationViewModel.init');
  }

  Future<User?> registerPressed() async{
    print('RegistrationViewModel.registerPressed');
    User? optionalUser = await apiService.registerUser();
    return optionalUser;
  }

}