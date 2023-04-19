import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectModel {
  SubjectModel({
    this.id,
    required this.name,
    required this.attended,
    required this.classes,
    this.ownerId,
  });

  String? id;
  String name;
  String? ownerId;
  int classes, attended;

  factory SubjectModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return SubjectModel(
        id: documentSnapshot.id,
        name: data['name'],
        attended: data['attended'],
        classes: data['classes'],
        ownerId: data['ownerId']);
  }

  static List<SubjectModel> subjects = [
    SubjectModel(name: 'Computer Networks', attended: 32, classes: 40),
    SubjectModel(name: 'Software Engineering', attended: 30, classes: 40),
    SubjectModel(name: 'Machine Learning', attended: 36, classes: 40),
    SubjectModel(name: 'Cloud Computing', attended: 39, classes: 40),
  ];

  toJson() {
    return {
      'name': name,
      'classes': classes,
      'attended': attended,
      'ownerId': ownerId,
    };
  }

  setOwnerId(String oid) {
    ownerId = oid;
  }

  updateCounters(int attended, int classes) {
    this.attended = attended;
    this.classes = classes;
  }
}
