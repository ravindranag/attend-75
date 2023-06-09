import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginExistingUser(String email, String password) async {
    await AuthRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}