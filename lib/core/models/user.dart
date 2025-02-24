class User {
  String? email;
  String? password;
  String? name;
  String? avatar;
  String? role;
  String? accessToken;
  String? refreshToken;
  int? id;

  User({this.email, this.password, this.name, this.avatar, this.role, this.id, this.accessToken, this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['role'];
    id = json['id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['avatar'] = avatar;
    data['role'] = role;
    data['id'] = id;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
