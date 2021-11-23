import 'package:noteyio_flutter/views/basemodel.dart';

class IntroViewModel extends BaseModel{

  Future init() async {
    print('IntroViewModel.init');
  }

  getStarted(){
    print('Clicked Get Started');
  }

}