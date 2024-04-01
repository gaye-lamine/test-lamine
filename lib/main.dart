import 'package:flutter/material.dart';
import 'package:terappmobile/screens/auth/cgu.dart';
import 'package:terappmobile/screens/auth/deliverytrack.dart';
import 'package:terappmobile/screens/auth/home/abonnement.dart';
import 'package:terappmobile/screens/auth/home/accueil.dart';
import 'package:terappmobile/screens/auth/home/carte_abonnement.dart';
import 'package:terappmobile/screens/auth/home/home.dart';
import 'package:terappmobile/screens/auth/home/modify_profile.dart';
import 'package:terappmobile/screens/auth/home/profile.dart';
import 'package:terappmobile/screens/auth/info_perso.dart';
import 'package:terappmobile/screens/auth/otp.dart';
import 'package:terappmobile/screens/auth/sign_up.dart';
import 'package:terappmobile/screens/auth/splash.dart';
import 'package:terappmobile/screens/train/suivi_voyage.dart';
import 'package:terappmobile/screens/train/train_voyage.dart';
import 'package:terappmobile/screens/auth/welcome.dart';
import 'package:terappmobile/utils/app_colors.dart';

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
      home: InfoPerso(),
    );
  }
}
