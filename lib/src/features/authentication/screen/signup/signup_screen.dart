import 'widgets/signup_form.dart';

import 'widgets/signup_screen_header.dart';
import 'package:flutter/material.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: const [
                SignUpScreenHeader(),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}