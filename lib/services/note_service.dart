import 'package:noteyio/models/SearchQueryDto.dart';
import 'package:noteyio/models/UserNoteList.dart';

import 'api_service.dart';

class NoteService{
  Future<UserNoteList?> getNotesForUser({required String userId,  required ApiService apiService}) async{
    return apiService.getNotesForUser(userId);
  }
  Future<UserNoteList?> searchForNotes({required String query, required String userId, required ApiService apiService})async{
    SearchQueryDto searchQueryDto = new SearchQueryDto(searchQuery: query, userId: userId);
    return apiService.searchForNote(searchQueryDto);
  }
}