import 'package:attend_75/src/constants/text.dart';
import 'package:attend_75/src/features/authentication/controller/forgot_password_controller.dart';
import 'package:attend_75/src/features/authentication/screen/login/verify_otp_screeen.dart';
import 'package:attend_75/src/repository/exceptions/signup_with_email_password_exception.dart';
import 'package:attend_75/src/utils/show_snack_bar.dart';
import 'package:attend_75/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({
    super.key,
  });

  @override
  State<ForgotPasswordBottomSheet> createState() => _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  final emailController = TextEditingController();
  bool loading = false;
  final forgotPasswordController = Get.put(ForgotPasswordController());
  String? helperText;

  @override
  Widget build(BuildContext context) {
    void success(String email) {
      Navigator.pop(context);
      showSnackBar(context, 'Password reset email sent to $email');
    }

    void handleSubmit() async {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        loading = true;
      });
      try {
        final email = emailController.text.trim();
        await forgotPasswordController.sendPasswordResetEmail(email);
        success(email);
      } on SignUpWithEmailAndPasswordException catch(e) {
        setState(() => helperText = e.message);
      } catch (_) {
        setState(() => helperText = 'Something went wrong.');
      } finally {
        setState(() {
          loading = false;
        });
      }
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(32.0,),
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
                          controller: emailController,
                          helperText: helperText,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: handleSubmit,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Next'),
                                if(loading) Row(
                                  children: [
                                    const SizedBox(width: 8.0,),
                                    SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: CircularProgressIndicator(
                                        color: Theme.of(context).colorScheme.onPrimary,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
