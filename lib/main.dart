import 'package:courses_app/src/features/authentication/screen/welcome/welcome.dart';
import 'package:courses_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(context, Brightness.light),
      darkTheme: AppTheme.getTheme(context, Brightness.dark),
      themeMode: ThemeMode.system,
      title: 'Attend75',
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: WelcomeScreen(),
          );
        },
      )
    );
  }
}
