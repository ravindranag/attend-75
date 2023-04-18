import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? uid;
  String name;
  String email;
  String password;
  String? avatarUrl;

  UserModel({
    this.id,
    this.uid,
    required this.name,
    required this.email,
    required this.password,
    this.avatarUrl,
  });

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  ) {
    final data = documentSnapshot.data()!;
    return UserModel(
        id: documentSnapshot.id,
        uid: data['userId'],
        name: data['name'],
        email: data['email'],
        password: '',
        avatarUrl: data['avatarUrl']);
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'userId': uid,
      'avatarUrl': avatarUrl,
    };
  }

  setUid(String uid) {
    this.uid = uid;
  }

  update({required String name, required String avatarUrl}) {
    this.name = name;
    this.avatarUrl = avatarUrl;
  }
}
