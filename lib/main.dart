// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:r3grow/Login/splashScreen.dart';
import 'package:r3grow/Login/verifyEmailPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            SplashScreen();
            if (snapshot.hasData) {
              return VerifyEmailPageWidget();
            } else {
              return SplashScreen();
            }
          },
        ),
      );
  // return MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   title: "R3GROW",
  //   home: SplashScreen(),
  // );
}
