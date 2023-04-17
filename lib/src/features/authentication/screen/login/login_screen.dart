import 'package:flutter/material.dart';

import 'widgets/login_form.dart';
import 'widgets/login_screen_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: const [
                LoginScreenHeader(),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}