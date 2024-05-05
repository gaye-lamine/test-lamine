import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terappmobile/provider/auth_provider.dart';
import 'package:terappmobile/provider/get_user_provider.dart';
import 'package:terappmobile/provider/seter_provider.dart';
import 'package:terappmobile/provider/train_provider.dart';
import 'package:terappmobile/screens/auth/sign_up.dart';
import 'package:terappmobile/screens/auth/splash.dart';
import 'package:terappmobile/screens/train/gare_detail.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ChangeNotifierProvider<SeterProvider>(create: (_) => SeterProvider()),
          ChangeNotifierProvider<GareProvider>(create: (_) => GareProvider()),
          ChangeNotifierProvider<GetUserProvider>(
              create: (_) => GetUserProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // ...
          home: SignUp(),
        ));
  }
}
