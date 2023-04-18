import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/features/profile/controller/profile_controller.dart';
import 'package:attend_75/src/features/profile/screen/profile/profile_screen.dart';
import 'package:attend_75/src/features/profile/screen/profile/widgets/profile_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardSliverAppBar extends StatelessWidget {
  const DashboardSliverAppBar({
    super.key,
    required this.currentUser
  });

  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 60;
        return SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: [
                  Positioned(
                    bottom: 36.0,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 300),
                      scale: scrolled ? 0.0 : 1.0,
                      child: ProfileNetworkImage(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(4.0),
                        profileImageUrl: currentUser.avatarUrl,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ProfileScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Hi ${currentUser.name}',
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .inverseSurface),
                    ),
                  ),
                ],
              ),
              titlePadding:
              const EdgeInsetsDirectional.only(start: 16, bottom: 16),
        ),
        leading: null,
        automaticallyImplyLeading: false,
        );
      },
    );
  }
}
