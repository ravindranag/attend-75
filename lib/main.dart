import 'package:attend_75/firebase_options.dart';
import 'package:attend_75/src/features/authentication/screen/welcome/welcome.dart';
import 'package:attend_75/src/features/profile/controller/profile_controller.dart';
import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:attend_75/src/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  //Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: isDarkMode ? Brightness.dark : Brightness.light)
  );
  //Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
  Firebase.initializeApp(options: DefaultFirebaseOptions.android)
      .then((value) => Get.put(AuthRepository()))
      .then((value) => Get.put(ProfileController()));
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
