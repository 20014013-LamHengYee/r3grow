// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, await_only_futures, unrelated_type_equality_checks

import 'dart:io';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:r3grow/Journey/storageFirebase.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  late double steps;
  late int point;
  String barcode = "R3grow.png";
  final storage = FirebaseStorage.instance;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // final _firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> account = FirebaseFirestore.instance
      .collection('users')
      .where("email",
          isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
      .snapshots();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
        actions: [
          IconButton(
              onPressed: () {
                controller!.flipCamera();
              },
              icon: Icon(Icons.cameraswitch_outlined))
        ],
      ),
      body:
          // FutureBuilder(
          //   future: FireStoreDataBase().getData(),
          // builder: (context, snapshot) async {

          // },
          Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // if (result != null)
                  //   Text(
                  //       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'),
                  // // else
                  // //   const Text('Scan QR code'),
                  FutureBuilder(
                    future: FireStoreDataBase().getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        StreamBuilder<QuerySnapshot>(
                          stream: account,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot,
                          ) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Loading');
                            }

                            final data = snapshot
                                .requireData; // take data from the snapshot
                            steps = (data.docs[0]['steps']).toDouble();
                            point = data.docs[0]['points'];

                            if (result ==
                                Image.network(snapshot.data.toString())) {
                              steps + 0.001;
                              // steps = steps + 0.01;
                              point = point + 1;

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser?.uid
                                      .toString())
                                  .update({'steps': steps});

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(FirebaseAuth.instance.currentUser?.uid
                                      .toString())
                                  .update({'points': point});
                            }
                            return Text('Successfully added');
                          },
                        );
                      }
                      return Text('Successfully added');
                    },
                  ),
                  // StreamBuilder<QuerySnapshot>(
                  //   stream: account,
                  //   builder: (
                  //     BuildContext context,
                  //     AsyncSnapshot<QuerySnapshot> snapshot,
                  //   ) {
                  //     if (snapshot.hasError) {
                  //       return Text('Something went wrong');
                  //     }

                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Text('Loading');
                  //     }

                  //     final data =
                  //         snapshot.requireData; // take data from the snapshot
                  //     steps = (data.docs[0]['steps']).toDouble();
                  //     point = data.docs[0]['points'];

                  //     final qrCode = Image.network('${data}');

                  //     // TEMPORARY ONLY
                  //     return data;
                  //   },
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future scan() async {
    try {
      String barcode = (await BarcodeScanner.scan()) as String;
      setState(() => this.barcode = barcode);
      print("scanned sucsessfully");
      steps = steps + 0.001;
      // steps = steps + 0.01;
      point = point + 1;

      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid.toString())
          .update({'steps': steps});

      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid.toString())
          .update({'points': point});

      //plus one to points when scanned
      // String userId = (await FirebaseAuth.instance.currentUser!).uid;
      // final CollectionReference pointsCollection = Firestore.instance.collection("users");
      // await pointsCollection.document(userId).collection('points').document(userId)
      // .updateData({
      //   "points": FieldValue.increment(1),
      //   "transactions": FieldValue.increment(-1)
      //   });

    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => barcode = 'Unknown error: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
