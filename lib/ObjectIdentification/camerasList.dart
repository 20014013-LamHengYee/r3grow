import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/ObjectIdentification/objectMain.dart';

Future<void> UserCamera() async {
  List<CameraDescription> cameras;
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(
      cameras,
    ),
  ));
}

late List<CameraDescription> cameras;
