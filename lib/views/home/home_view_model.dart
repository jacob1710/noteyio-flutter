import 'package:flutter/material.dart';
import 'package:noteyio/views/basemodel.dart';

class HomeViewModel extends BaseModel{

  String searchTerm = '';

  Icon customIcon = Icon(Icons.search);

  Widget customSearchBar = Text(
    "NoteyIO",
    style: TextStyle(color: Colors.white),
  );

  Future<void> init() async{
    print('HomeViewModel.init');
  }
}