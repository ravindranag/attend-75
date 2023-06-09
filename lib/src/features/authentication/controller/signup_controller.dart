import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> registerNewUser(UserModel user) async {
    await AuthRepository.instance.createUserWithEmailAndPassword(user);
  }
}