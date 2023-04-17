import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/features/authentication/screen/welcome/welcome.dart';
import 'package:attend_75/src/features/dashboard/screen/dashboard/dashboard_screen.dart';
import 'package:attend_75/src/repository/exceptions/signup_with_email_password_exception.dart';
import 'package:attend_75/src/repository/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, UserModel user) async {
    Get.put(UserRepository());
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      user.setUid(userCred.user!.uid);
      await UserRepository.instance.createUser(user);
      if (firebaseUser.value != null) {
        Get.offAll(() => const DashboardScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordException.code(e.code);
      print('Firebase Auth Failure ${ex.message}');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ex.message)));
      throw ex;
    } catch (_) {
      print(_.toString());
      const ex = SignUpWithEmailAndPasswordException();
      print('Firebase Auth Failure ${ex.message}');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ex.message)));

      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
