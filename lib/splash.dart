import 'package:flutter/material.dart';
import 'package:my_project/home.dart';
import 'package:my_project/login.dart';
import 'package:my_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/welcome.jpg'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => LoginPage(),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctc1) => HomeScreen()));
    }
  }
}
