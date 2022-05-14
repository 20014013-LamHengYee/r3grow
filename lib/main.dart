import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:r3grow/Journey/journey.dart';

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
            Image.asset('assets/images/R3grow.png'),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'R3grow',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        nextScreen: HomePageWidget(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color(0xFFF1FDFB),
      ),
    );
  }
}
