import 'package:courses_app/src/repository/auth_repository.dart';
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
                      child: const Icon(Icons.person),
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
          actions: [
            IconButton(
              onPressed: () {
                AuthRepository.instance.logout();
              },
              icon: Icon(
                Icons.power_settings_new,
                color: Theme.of(context).colorScheme.error,
              ),
            )
          ],
          leading: null,
          automaticallyImplyLeading: false,
        );
      },
    );
  }
}
