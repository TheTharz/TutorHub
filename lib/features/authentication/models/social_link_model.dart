import 'package:cloud_firestore/cloud_firestore.dart';

class SocialLinkModel {
  // final String id;
  // final String userid;
  final String? facebook;
  final String? twitter;
  final String? linkedin;

  SocialLinkModel(
      {
      // required this.id,
      // required this.userid,
      this.facebook = '',
      this.twitter = '',
      this.linkedin = ''});

  static SocialLinkModel empty() {
    return SocialLinkModel(
      // id: '',
      // userid: '',
      facebook: '',
      twitter: '',
      linkedin: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'userid': userid,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
    };
  }

  factory SocialLinkModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return SocialLinkModel(
        // id: document.id,
        // userid: data['userid'] ?? '',
        facebook: data['facebook'] ?? '',
        twitter: data['twitter'] ?? '',
        linkedin: data['linkedin'] ?? '',
      );
    } else {
      return SocialLinkModel.empty();
    }
  }

  SocialLinkModel copyWith({
    // String? id,
    // String? userid,
    String? facebook,
    String? twitter,
    String? linkedin,
  }) {
    return SocialLinkModel(
      // id: id ?? this.id,
      // userid: userid ?? this.userid,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
    );
  }

  //from map
  factory SocialLinkModel.fromMap(Map<String, dynamic> map) {
    final data = map;
    if (data.isEmpty) return SocialLinkModel.empty();
    return SocialLinkModel(
      // id: data['id'] ?? '',
      facebook: data['facebook'] ?? '',
      twitter: data['twitter'] ?? '',
      linkedin: data['linkedin'] ?? '',
    );
  }
}
