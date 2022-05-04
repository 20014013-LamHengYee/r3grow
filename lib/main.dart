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
  // heng yee comment
  // regan lee comment

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "R3GROW",
      theme: ThemeData(
        // primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color(0x00f1fdfb),
      ),
      home: const HomePageWidget(),
    );
  }
}
