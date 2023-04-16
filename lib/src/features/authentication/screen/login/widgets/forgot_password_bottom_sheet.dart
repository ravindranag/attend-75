import 'package:courses_app/src/constants/text.dart';
import 'package:courses_app/src/features/authentication/screen/login/verify_otp_screeen.dart';
import 'package:courses_app/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  const ForgotPasswordBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Column(
            children: [
              const Icon(
                Icons.lock_reset,
                size: 80,
              ),
              Text(
                appForgotPasswordModalTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                appForgotPasswordModalSubtitle,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    OutlinedTextField(
                      label: const Text('Email'),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const VerifyOtpScreen();
                            }),
                          );
                        },
                        child: const Text('Next'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
