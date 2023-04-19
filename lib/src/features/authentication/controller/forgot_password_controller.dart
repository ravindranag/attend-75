import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:attend_75/src/repository/exceptions/signup_with_email_password_exception.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final _authRepository = Get.put(AuthRepository());

  Future<void> sendPasswordResetEmail(String email) async {
    await _authRepository.sendPasswordResetEmail(email);
  }

  Future<void> confirmPasswordReset(String code, String newPassword) async {
    await _authRepository.confirmPasswordReset(code, newPassword);
  }
}