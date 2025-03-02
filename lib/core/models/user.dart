import 'dart:convert';

class User {
  String? email;
  String? user;
  String? password;
  String? name;
  String? avatar;
  String? role;
  String? accessToken;
  String? refreshToken;
  String? id;

  User({this.email, this.user, this.password, this.name, this.avatar, this.role, this.id, this.accessToken, this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    user = json['user'];
    password = json['password'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['roles'];
    id = json['id'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['user'] = user;
    data['password'] = password;
    data['name'] = name;
    data['avatar'] = avatar;
    data['roles'] = role;
    data['id'] = id;
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
