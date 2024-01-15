import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';

class TutorPostModel {
  String id;
  String title;
  String? description;
  String subject;
  String grade;
  String image;
  int hourlyPrice;
  String location;
  UserModel owner;
  String preferredMethod;
  String preferredDate;
  String degree;
  int experience;

  TutorPostModel({
    required this.id,
    required this.title,
    this.description,
    required this.subject,
    required this.grade,
    required this.image,
    required this.hourlyPrice,
    required this.location,
    required this.owner,
    required this.preferredMethod,
    required this.preferredDate,
    required this.degree,
    required this.experience,
  });

//map json oriented document snapshot from firebase to model
  factory TutorPostModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return TutorPostModel.empty();
    }
    print('Data from Firestore for document ID ${document.id}: $document.data');
    final data = document.data()!;

    return TutorPostModel(
      id: document.id,
      title: data['Title'],
      description: data['Description'],
      subject: data['Subject'],
      grade: data['Grade'],
      image: data['GigImage'],
      hourlyPrice: data['HourlyPrice'],
      location: data['Location'],
      //owner is stored as a reference in the tutorpost document it refer to a document in users collection
      owner: UserModel.fromMap(data['Owner']),
      preferredMethod: data['PreferredMethod'],
      preferredDate: data['Dates'],
      degree: data['Degree'],
      experience: data['Experience'],
    );
  }

  //convert model to json
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Description': description,
      'Subject': subject,
      'Grade': grade,
      'GigImage': image,
      'HourlyPrice': hourlyPrice,
      'Location': location,
      'Owner': owner.toJson(),
      'PreferredMethod': preferredMethod,
      'PreferredDate': preferredDate,
      'Degree': degree,
      'Experience': experience,
    };
  }

  //empty tutor post model
  static TutorPostModel empty() {
    return TutorPostModel(
      id: '',
      title: '',
      description: '',
      subject: '',
      grade: '',
      image: '',
      hourlyPrice: 0,
      location: '',
      owner: UserModel.empty(),
      preferredMethod: '',
      preferredDate: '',
      degree: '',
      experience: 0,
    );
  }
}
