import 'package:courses_app/firebase_options.dart';
import 'package:courses_app/src/features/authentication/screen/welcome/welcome.dart';
import 'package:courses_app/src/repository/auth/auth_repository.dart';
import 'package:courses_app/src/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.android)
      .then((value) => Get.put(AuthRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(context, Brightness.light),
      darkTheme: AppTheme.getTheme(context, Brightness.dark),
      themeMode: ThemeMode.system,
      title: 'Attend75',
      home: Builder(
        builder: (context) {
          return const Scaffold(
            body: SafeArea(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
