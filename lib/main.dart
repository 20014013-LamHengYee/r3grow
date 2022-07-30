// ignore_for_file: prefer_const_constructors
// cfm no onedrive

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:r3grow/Login/splashScreen.dart';

import 'ObjectIdentification/objectMain.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "R3GROW",
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/object': (context) => ObjectDetectMain(cameras),
      }
       //SplashScreen(),
    );
    // return Scaffold(
    //   body: StreamBuilder<User?>(
    //       stream: FirebaseAuth.instance.authStateChanges(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return HomePageWidget();
    //         } else {
    //           return SplashScreen();
    //         }
    //       }),
    // );
  }
}
