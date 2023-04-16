import 'package:courses_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Attend75 y'),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Plus'),
                  ),
                  FilledButton(onPressed: () {}, child: Text('Play')),
                  Text(
                    'Welcome RV play',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text('Maintain 75% attendance to prevent year back')
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
