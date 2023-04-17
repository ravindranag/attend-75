import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection('Users').add(user.toJson());
  }
}
