import 'package:courses_app/src/constants/images.dart';
import 'package:courses_app/src/features/authentication/controller/signup_controller.dart';
import 'package:courses_app/src/features/authentication/model/user_model.dart';
import 'package:courses_app/src/features/authentication/screen/login/login_screen.dart';
import 'package:courses_app/src/widgets/common/outlined_password_text_field.dart';
import 'package:courses_app/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

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
                    'Name',
                  ),
                  controller: controller.name,
                ),
                const SizedBox(
                  height: 16.0,
                ),
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
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    UserModel user = UserModel(
                      name: controller.name.text.trim(),
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                    );
                    SignUpController.instance.registerNewUser(context, user);
                  }
                },
                child: const Text(
                  'Signup',
                ),
              ),
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
                  const Text('Signup with Google')
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
                      return const LoginScreen();
                    },
                  ),
                );
              },
              child: Text.rich(TextSpan(
                  text: "Already have an account?",
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: ' Login',
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
