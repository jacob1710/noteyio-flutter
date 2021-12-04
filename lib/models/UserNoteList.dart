import 'dart:convert';

import 'Note.dart';

class UserNoteList{
  late List<Note> notes;

  UserNoteList({
    required this.notes
  });

  UserNoteList.fromJson(Map<String, dynamic> json){
    List<dynamic> notesListJSON = (json['notes'] as List<dynamic>);
    print(notesListJSON);
    notes = <Note>[];

    notesListJSON.forEach((element) {
      print('element= $element');
      Map<String, dynamic> noteJsonMapping = (element as Map<String, dynamic>);
      notes.add(Note.fromJson(noteJsonMapping));


    });
  }


}