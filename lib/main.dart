import 'package:flutter/material.dart';
import 'package:terappmobile/screens/auth/splash.dart';

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
        // colorScheme: AppColors.marron,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
