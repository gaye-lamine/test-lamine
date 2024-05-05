import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terappmobile/provider/auth_provider.dart';
import 'package:terappmobile/provider/get_user_provider.dart';
import 'package:terappmobile/provider/seter_provider.dart';
import 'package:terappmobile/provider/train_provider.dart';
import 'package:terappmobile/provider/update_user_infos_provider.dart';
import 'package:terappmobile/screens/home/ticket.dart';

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
          ChangeNotifierProvider<UpdateUserInfosProvider>(
              create: (_) => UpdateUserInfosProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // ...
          home: Ticket(),
        ));
  }
}
