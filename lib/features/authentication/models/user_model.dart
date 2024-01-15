import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutorhub/repository/models/chat.dart';

class UserModel {
  final String id;
  final String email;
  // String password;
  final String username;
  String? picture;
  String? city;
  List<Chat>? chats;

  UserModel({
    required this.id,
    required this.email,
    // required this.password,
    required this.username,
    required this.picture,
    required this.city,
  });

  //static function to create an empty user model
  static UserModel empty() {
    return UserModel(
      id: '',
      email: '',
      // password: '',
      username: '',
      picture: '',
      city: '',
    );
  }

  //convert model to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      // 'password': password,
      'username': username,
      'picture': picture,
      'city': city,
    };
  }

  //factory method to create a usermodel from a firestore document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    print('hello');

    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['email'] ?? '',
        username: data['username'] ?? '',
        picture: data['picture'] ?? '',
        city: data['city'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final data = map;
    if (data.isEmpty) return UserModel.empty();
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      picture: map['picture'] ?? '',
      city: map['city'] ?? '',
    );
  }
}
