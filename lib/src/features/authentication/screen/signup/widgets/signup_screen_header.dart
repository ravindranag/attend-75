import 'package:courses_app/src/constants/images.dart';
import 'package:courses_app/src/constants/text.dart';
import 'package:flutter/material.dart';


class SignUpScreenHeader extends StatelessWidget {
  const SignUpScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(appLogo),
          width: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              Text(
                appSignUpTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Text(
                appSignUpSubtitle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
