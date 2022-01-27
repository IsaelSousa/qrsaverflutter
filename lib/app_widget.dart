import 'package:flutter/material.dart';
import 'package:qrsaver/Screen/LoginScreen/login_screen.dart';
import 'package:qrsaver/Screen/SplashScreen/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRSaver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/loginscreen',
      routes: {
      '/': (context) => const SplashPage(),
      '/loginscreen': (context) => const LoginScreen(),
      },
    );
  }
}
