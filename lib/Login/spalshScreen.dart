// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names

import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/Login/LoginPage.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 3), () {
      SplashTransition.fadeTransition;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPageWidget()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FDFB),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'assets/images/regrowsslogo.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
