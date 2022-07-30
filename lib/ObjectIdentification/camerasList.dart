// ignore_for_file: file_names, non_constant_identifier_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/ObjectIdentification/objectMain.dart';

Future<void> UserCamera() async {
  List<CameraDescription> cameras;
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ObjectDetectMain(
      cameras,
    ),
  ));
}

late List<CameraDescription> cameras;
