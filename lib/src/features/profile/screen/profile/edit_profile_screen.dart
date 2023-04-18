import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/features/profile/controller/profile_controller.dart';
import 'package:attend_75/src/features/profile/screen/profile/profile_screen.dart';
import 'package:attend_75/src/features/profile/screen/profile/widgets/profile_network_image.dart';
import 'package:attend_75/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    final name = TextEditingController(text: currentUser.name);
    final avatarUrl = TextEditingController(text: currentUser.avatarUrl);

    void navigateToProfileScreen() {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ProfileScreen();
          },
        ),
      );
    }

    void handleSave() async {
      try {
        currentUser.update(
          name: name.text.toString().trim(),
          avatarUrl: avatarUrl.text.trim(),
        );
        // print(currentUser.toJson().toString());
        await profileController.updateCurrentUserDetails(currentUser);
        navigateToProfileScreen();
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileNetworkImage(profileImageUrl: currentUser.avatarUrl),
              const SizedBox(
                height: 32.0,
              ),
              Column(
                children: [
                  OutlinedTextField(
                    label: const Text('Name'),
                    controller: name,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  OutlinedTextField(
                    label: const Text('Avatar URL'),
                    controller: avatarUrl,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: handleSave,
                    child: const Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
