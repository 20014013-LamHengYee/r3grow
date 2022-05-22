import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:r3grow/Journey/journey.dart';
import 'package:r3grow/chatbot.dart';

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
        duration: 1500,
        splash: Stack(
          children: [
            Image.asset(
              'assets/images/regrowsslogo.png',
              width: 200,
              height: 150,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
        nextScreen: const HomePageWidget(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color(0xFFF1FDFB),
      ),
    );
  }
}
