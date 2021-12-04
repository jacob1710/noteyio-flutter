import 'package:noteyio/models/NewNoteDto.dart';
import 'package:noteyio/views/basemodel.dart';

class CreateNoteViewModel extends BaseModel{

  String text = '';
  var tags = <String>[];
  String title = '';

  Future<void> init() async{
    print('CreateNoteViewModel.init');
  }

  Future<bool> createPressed() async{
    print('CreateNoteViewModel.createPressed');
    print(text+'--'+title+'--'+userService.getUser().id);
    NewNoteDto newNoteDto = new NewNoteDto(
        userId: userService.getUser().id, text: text,
        imgId: '', title: title
    );
    bool? result = await apiService.createNewNote(newNoteDto);
    if(result == null){
      return false;
    }else{
      return result;
    }
  }
}