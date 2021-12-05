class NewNoteDto{
  String userId;
  String text;
  String imgId;
  String title;
  var tags = <String>[];
  NewNoteDto({required this.userId, required this.text, required this.imgId, required this.title, required this.tags});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> newNote = new Map<String, dynamic>();
    newNote['userId'] = this.userId;
    newNote['text'] = this.text;
    newNote['imgId'] = this.imgId;
    newNote['title'] = this.title;
    newNote['tags'] = this.tags;
    return newNote;
  }

}