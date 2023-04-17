import 'package:courses_app/src/features/authentication/model/user_model.dart';
import 'package:courses_app/src/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void registerNewUser(BuildContext context, UserModel user) {
    AuthRepository.instance.createUserWithEmailAndPassword(context, user);
  }
}