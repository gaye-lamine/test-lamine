import 'package:flutter/material.dart';
import 'package:terappmobile/screens/cgu.dart';
import 'package:terappmobile/screens/info_perso.dart';
import 'package:terappmobile/screens/otp.dart';
import 'package:terappmobile/screens/sign_up.dart';
import 'package:terappmobile/screens/splash.dart';
import 'package:terappmobile/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
