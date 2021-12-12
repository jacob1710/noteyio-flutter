import 'dart:io';

import 'package:noteyio/views/basemodel.dart';

class IndividualNoteViewModel extends BaseModel{

  Future<void> init() async{
    await populateHeaders();
  }

}