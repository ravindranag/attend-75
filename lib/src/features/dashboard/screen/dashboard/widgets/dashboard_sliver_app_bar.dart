import 'package:attend_75/src/constants/images.dart';
import 'package:attend_75/src/features/profile/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardSliverAppBar extends StatelessWidget {
  const DashboardSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 50;
        return SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Stack(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Positioned(
                  bottom: 36.0,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: scrolled ? 0.0 : 1.0,
                    child: CircleAvatar(
                      radius: scrolled ? 0.0 : 30.0,
                      child: InkResponse(
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
                        child: FadeInImage.assetNetwork(
                          image: 'https://picsart.com/ing',
                          placeholder: appLogo,
                          fit: BoxFit.contain,
                          placeholderFit: BoxFit.contain,
                          width: 100,
                          height: 100,
                          imageErrorBuilder: (_, __, ___) {
                            return Image.asset(appLogo);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Hi Ravindra',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface),
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
