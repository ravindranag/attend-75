import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:attend_75/src/repository/user/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthRepository());
  final _userRepo = Get.put(UserRepository());
  late final Rx<UserModel?> currentUser;


  @override
  void onReady() {
    getCurrentUserDetails().then((value) {
      currentUser = Rx<UserModel?>(value);
    });
  }

  Future<UserModel> getCurrentUserDetails() async {
    try {
      final email = _authRepo.firebaseUser.value?.email;
      if(email != null) {
        final currentUserDetails = await _userRepo.getUserDetails(email);
        return currentUserDetails;
      } else {
        throw 'Cannot get email. Try login again';
      }
    } catch (e) {
      // print(e);
      throw Exception('Failed to fetch profile');
    }
  }

  Future<bool> updateCurrentUserDetails(UserModel user) async {
    try {
      await _userRepo.updateUserDetails(user);
      return true;
    } catch (e) {
      throw Exception('Failed to update profile');
    }
  }

}