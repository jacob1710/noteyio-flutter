import 'package:noteyio_flutter/views/basemodel.dart';

class LoginViewModel extends BaseModel{

  String currentEmail = '';
  String currentPwd = '';

  Future<void> init() async{
    print('LoginViewModel.init');
  }
  bool loginPressed(){
    print(currentEmail+'@'+currentPwd);
    return true;
  }
}