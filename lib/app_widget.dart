import 'package:flutter/material.dart';
import 'package:qrsaver/Screen/HomeScreen/home_screen.dart';
import 'package:qrsaver/Screen/LoginScreen/login_screen.dart';
import 'package:qrsaver/Screen/QRCodeScannerScreen/qrcode_scanner_screen.dart';
import 'package:qrsaver/Screen/SplashScreen/splash_screen.dart';
import 'package:qrsaver/shared/models/user_model.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRSaver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/loginscreen',
      routes: {
      '/': (context) => const SplashPage(),
      '/loginscreen': (context) => const LoginScreen(),
      '/homescreen': (context) => const HomeScreen(),
      '/qrcodescannerscreen':(context) => const QRCodeScannerScreen()
      },
    );
  }
}

