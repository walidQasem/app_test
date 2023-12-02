
// ignore_for_file: file_names

class User {
  int? id;
  String? name;
  List<int>? friends;
  List<String>? interests;

  User({this.id, this.name, this.friends, this.interests});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    friends = json['friends'].cast<int>();
    interests = json['interests'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['friends'] = friends;
    data['interests'] = interests;
    return data;
  }

  contains(String interest) {}
}