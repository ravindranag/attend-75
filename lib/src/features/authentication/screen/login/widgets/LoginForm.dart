import 'package:courses_app/src/constants/images.dart';
import 'package:courses_app/src/constants/text.dart';
import 'package:courses_app/src/features/authentication/screen/signup/signup_screen.dart';
import 'package:courses_app/src/features/dashboard/screen/dashboard/dashboard_screen.dart';
import 'package:courses_app/src/widgets/common/outlined_password_text_field.dart';
import 'package:courses_app/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';

import 'forgot_password_bottom_sheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    print({_emailController.text, _passwordController.text});
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const DashboardScreen();
        },
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              OutlinedTextField(
                label: const Text(
                  'Email',
                ),
                controller: _emailController,
              ),
              const SizedBox(
                height: 16.0,
              ),
              OutlinedPasswordTextField(
                label: const Text('Password'),
                controller: _passwordController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      // enableDrag: true,
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) {
                        return const ForgotPasswordBottomSheet();
                      });
                },
                child: const Text(
                  'Forgot password?',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(),
                  onPressed: _handleLogin,
                  child: const Text(
                    'Login',
                  ),
                ),
              ),
            ],
          ),
        ),
        const Text('OR'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OutlinedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: const DecorationImage(
                        image: AssetImage(googleLogo), fit: BoxFit.contain),
                    // shape: BoxShape.rectangle
                  ),
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text('Login with Google')
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
            child: Text.rich(TextSpan(
                text: "Don't have an account?",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: ' Signup',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.apply(color: Theme.of(context).colorScheme.primary),
                  )
                ])),
          ),
        )
      ],
    );
  }
}
