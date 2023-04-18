import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection('Users').add(user.toJson());
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection('Users').where('email', isEqualTo: email).get();
    final userDetails = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userDetails;
  }

  Future<bool> updateUserDetails(UserModel user) async {
    await _db.collection('Users').doc(user.id).update(user.toJson());
    return true;
  }
}
