// ignore_for_file: file_names
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireStoreDataBase {
  String? downloadURL;

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child("R3gow.png")
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}
