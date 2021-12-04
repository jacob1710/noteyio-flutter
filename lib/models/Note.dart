
class Note{

  late String userId;
  late String text;
  late String imgId;
  late List<String> tags;
  late String title;
  Note({
    required this.userId, required this.text, required this.tags, required this.title
    });


  Note.fromJson(Map<String, dynamic> json){
    userId = json['_id'];
    text = json['text'];
    title = json['title'];
    if(json['imgId'] != null){
      imgId = json['imgId'];
    }
    if(json['tags'] != null){
      tags = <String>[];
      json['tags'].forEach((v){
        tags.add(v);
      });
    }

  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Note{userId: $userId, text: $text , imgId: $imgId , title: $title, tags: $tags}';
  }
}