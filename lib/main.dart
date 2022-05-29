import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:r3grow/Journey/journey.dart';
import 'package:r3grow/Login/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "R3GROW",
      home: AnimatedSplashScreen(
        duration: 1300,
        splash: Image.asset(
          'assets/images/regrowsslogo.png',
          height: 200,
          width: 200,
        ),
        nextScreen: const HomePageWidget(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color(0xFFF1FDFB),
      ),
    );
  }
}
