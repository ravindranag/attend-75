import 'package:courses_app/src/constants/images.dart';
import 'package:courses_app/src/widgets/common/FilledCard.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileNetworkImage(
                onTap: () {},
                profileImageUrl:
                    'https://avatars.githubusercontent.com/u/74584143?v=4',
              ),
              const SizedBox(
                height: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ravindra Nag',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Text('ravindranag52@gmail.com'),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FilledButton(
                    onPressed: () {},
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
                onPressed: () {},
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 20.0,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                  foregroundColor: Theme.of(context).colorScheme.error,
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
          ),
        ),
      ),
    );
  }
}
