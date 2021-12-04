import 'package:noteyio/models/UserNoteList.dart';

import 'api_service.dart';

class NoteService{
  Future<UserNoteList?> getNotesForUser({required String userId,  required ApiService apiService,}) async{
    return apiService.getNotesForUser(userId);
  }
}