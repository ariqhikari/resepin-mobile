part of 'data.dart';

class User {
  final String id;
  final String name;
  final String email;
  static String? token;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
      );

  User copyWith({
    String? id,
    String? name,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
