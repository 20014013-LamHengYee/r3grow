// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:r3grow/Journey/qrCodeOutline.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
        actions: [
          IconButton(
              onPressed: () {
                cameraController.switchCamera();
              },
              icon: Icon(Icons.cameraswitch_outlined))
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (barcode, args) {
                debugPrint('Barcode Found!' + barcode.rawValue!);
              }),
          QrCodeOutline(overlayColor: Colors.black.withOpacity(0.5))
        ],
      ),
    );
  }
}
