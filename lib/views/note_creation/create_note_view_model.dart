import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noteyio/models/NewNoteDto.dart';
import 'package:noteyio/models/Note.dart';
import 'package:noteyio/views/basemodel.dart';

class CreateNoteViewModel extends BaseModel{

  String text = '';
  var tags = <String>[];
  String title = '';
  String currentTag = '';

  String noteId = '';
  File? imageFile;

  Future<void> init() async{
    print('CreateNoteViewModel.init');
  }

  Future<bool?> uploadImageToNote(String noteId) async{
    bool? value = await apiService.uploadImageToNote(imageFile!,noteId);
    return value;
  }

  Future<Note?> createPressed() async{
    print('CreateNoteViewModel.createPressed');
    print(text+'--'+title+'--'+userService.getUser().id);
    NewNoteDto newNoteDto = new NewNoteDto(
        userId: userService.getUser().id, text: text,
        imgId: '', title: title, tags: tags
    );
    Note? resultNote = await apiService.createNewNote(newNoteDto);
    return resultNote;
  }
  bool addTagToList(String tagName){
    if(tags.contains(tagName)){
      return false;
    }else{
      tags.add(tagName);
      return true;
    }

  }
}