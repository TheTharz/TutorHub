import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';

class StudentPostModel {
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

  StudentPostModel({
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
  });

//map json oriented document snapshot from firebase to model
  factory StudentPostModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return StudentPostModel.empty();
    }
    print('Data from Firestore for document ID ${document.id}: $document.data');
    final data = document.data()!;

    return StudentPostModel(
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
    };
  }

  //empty tutor post model
  static StudentPostModel empty() {
    return StudentPostModel(
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
    );
  }
}
