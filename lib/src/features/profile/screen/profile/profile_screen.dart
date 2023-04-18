import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/features/dashboard/screen/dashboard/dashboard_screen.dart';
import 'package:attend_75/src/features/profile/controller/profile_controller.dart';
import 'package:attend_75/src/features/profile/screen/profile/edit_profile_screen.dart';
import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/profile_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const DashboardScreen();
              },
            ), (route) => false);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<UserModel>(
              future: profileController.getCurrentUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final currentUser = snapshot.data!;
                    return Column(
                      children: [
                        ProfileNetworkImage(
                          onTap: () {},
                          profileImageUrl: currentUser.avatarUrl,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              currentUser.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(currentUser.email),
                            const SizedBox(
                              height: 16.0,
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return EditProfileScreen(
                                        currentUser: currentUser,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.edit),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text('Edit profile'),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Divider(),
                        ),
                        FilledButton.tonal(
                          onPressed: () {
                            AuthRepository.instance.logout();
                          },
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 20.0,
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.errorContainer,
                            foregroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.logout),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Logout')
                            ],
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
