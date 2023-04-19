import 'package:attend_75/src/constants/images.dart';
import 'package:attend_75/src/features/authentication/controller/login_controller.dart';
import 'package:attend_75/src/features/authentication/screen/signup/signup_screen.dart';
import 'package:attend_75/src/widgets/common/outlined_password_text_field.dart';
import 'package:attend_75/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgot_password_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    final formKey = GlobalKey<FormState>();

    void handleLogin() {
      LoginController.instance.loginExistingUser(
        controller.email.text.trim(),
        controller.password.text.trim(),
      );
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                OutlinedTextField(
                  label: const Text(
                    'Email',
                  ),
                  controller: controller.email,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                OutlinedPasswordTextField(
                  label: const Text('Password'),
                  controller: controller.password,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(),
                    onPressed: handleLogin,
                    child: const Text(
                      'Login',
                    ),
                  ),
                ),
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
              ],
            ),
          ),
          // const Text('OR'),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10.0),
          //   child: OutlinedButton(
          //     onPressed: () {},
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50.0),
          //             image: const DecorationImage(
          //                 image: AssetImage(googleLogo), fit: BoxFit.contain),
          //             // shape: BoxShape.rectangle
          //           ),
          //           width: 24,
          //           height: 24,
          //         ),
          //         const SizedBox(
          //           width: 8.0,
          //         ),
          //         const Text('Login with Google')
          //       ],
          //     ),
          //   ),
          // ),
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
      ),
    );
  }
}
