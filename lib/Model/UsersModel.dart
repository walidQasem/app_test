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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['friends'] = this.friends;
    data['interests'] = this.interests;
    return data;
  }
}