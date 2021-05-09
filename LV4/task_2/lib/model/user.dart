import 'dart:convert';

class User {
  final String id;
  final String name;
  final String avatar;
  final String email;
  User({
    this.id,
    this.name,
    this.avatar,
    this.email,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      avatar: map['avatar'],
      email: map['email'],
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
