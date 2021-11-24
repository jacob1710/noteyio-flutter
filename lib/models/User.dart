class User{
  String id;
  String email;
  String userName;
  User({required this.id,required this.email,required this.userName});

  @override
  String toString() {
    // TODO: implement toString
    return "ID: ${id}, Email: ${email}, userName:${userName} ";
  }
}
