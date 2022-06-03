import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:postest7_1915016084_yudiaulia/LandingPage.dart';
import 'package:postest7_1915016084_yudiaulia/HalamanForm.dart';
import 'package:postest7_1915016084_yudiaulia/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_Screen(),
    );
  }
}
