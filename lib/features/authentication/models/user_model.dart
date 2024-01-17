import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutorhub/features/authentication/models/social_link_model.dart';
import 'package:tutorhub/repository/models/chat.dart';

class UserModel {
  final String id;
  final String email;
  // String password;
  final String username;
  String? picture;
  String? city;
  List<Chat>? chats;
  String? phoneNumber;
  SocialLinkModel? socialLinkModel;
  String? bio;
  String? address;

  UserModel(
      {required this.id,
      required this.email,
      // required this.password,
      required this.username,
      required this.picture,
      required this.city,
      this.phoneNumber,
      this.socialLinkModel,
      this.bio,
      this.address});

  //static function to create an empty user model
  static UserModel empty() {
    return UserModel(
        id: '',
        email: '',
        // password: '',
        username: '',
        picture: '',
        city: '',
        phoneNumber: '',
        socialLinkModel: SocialLinkModel.empty(),
        bio: '',
        address: '');
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
      'phoneNumber': phoneNumber,
      'socialLinkModel': socialLinkModel?.toJson(),
      'bio': bio,
      'address': address,
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
        phoneNumber: data['phoneNumber'] ?? '',
        bio: data['bio'] ?? '',
        address: data['address'] ?? '',
        socialLinkModel: SocialLinkModel.fromMap(
          data['sociallinks'] ?? {},
        ),
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
      phoneNumber: map['phoneNumber'] ?? '',
      bio: map['bio'] ?? '',
      address: map['address'] ?? '',
      socialLinkModel: SocialLinkModel.fromMap(map['sociallinks'] ?? {}),
    );
  }
}
