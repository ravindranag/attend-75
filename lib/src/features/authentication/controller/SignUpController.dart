import 'package:courses_app/src/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void registerNewUser(String email, String password) {
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}