import 'package:courses_app/src/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginExistingUser(String email, String password) {
    AuthRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}