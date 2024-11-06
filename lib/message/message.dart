class Message {
  int id;
  String title;
  String message;

  Message(this.id, this.title, this.message);

  static Message fromJson(Map<String, dynamic> json) {
    return Message(json['id'], json['title'], json['description']);
  }
}