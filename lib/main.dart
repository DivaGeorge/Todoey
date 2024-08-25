import 'package:flutter/material.dart';
import 'package:my_project/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: SplashScreen(),
    );
  }
}
