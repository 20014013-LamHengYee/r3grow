// ignore_for_file: unused_import, unused_field, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:r3grow/Achievement/achievementMain.dart';
import 'package:r3grow/Journey/allVoucher.dart';
import 'package:r3grow/Journey/scanner.dart';
import 'package:r3grow/Journey/voucherRedemption.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r3grow/Account/accountPage.dart';
import 'package:r3grow/Map/map.dart';
import 'package:r3grow/chatbot/chatbot.dart';
import 'package:r3grow/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Stream<QuerySnapshot> voucher =
      FirebaseFirestore.instance.collection('Voucher').snapshots();

  String barcode = "R3grow.png";
  // PROGRESS BAR - STEPS
  late double steps;
  // 0.001 - 1 STEP
  // 0.025 - 25 STEP

  // POINTS
  late int point;

  // final _firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> account = FirebaseFirestore.instance
      .collection('users')
      .where("email",
          isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF8F4EC),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      // space between acheievement badge and QR Code
                      // change 100 back to 270
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 270, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AchievementPage()),
                              );
                            },
                            child: Image.asset(
                              'assets/images/achievement.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////////// QR CODE SCANNER ////////////////////////////////////////////////////
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Scanner()),
                            );
                          },
                          child: Image.asset(
                            'assets/images/scanner.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Your Hero Journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF48240C),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              //////////////////////////////////////////////////// HERO IMAGE ////////////////////////////////////////////////////
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              //   child: Align(
              //     alignment: Alignment.lerp(
              //         Alignment.topLeft, Alignment.topRight, step),
              //     child: Image.asset(
              //       'assets/images/hero.png',
              //       width: 150,
              //       height: 150,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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

                        final data =
                            snapshot.requireData; // take data from the snapshot
                        steps = (data.docs[0]['steps']).toDouble();
                        // steps = steps + 0.01;

                        return Expanded(
                          child: Align(
                            alignment: FractionalOffset(steps, 0),
                            child: Image.asset(
                              'assets/images/heroImg.png',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //////////////////////////////////////////////////// PROGRESS BAR (DETERMINATE) ////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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

                        final data =
                            snapshot.requireData; // take data from the snapshot

                        // because the progress bar only double decimal parameter type.
                        steps = (data.docs[0]['steps']).toDouble();
                        // steps = steps + 0.01;

                        return Expanded(
                          child: new Stack(children: <Widget>[
                            LinearProgressIndicator(
                              value: steps,
                              color: Color(0xFF226E44),
                              minHeight: 15,
                              backgroundColor: Colors.green,
                            ),
                            Padding(
                              // padding between label and bar
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Align(
                                alignment: FractionalOffset(steps, 0),
                                // use .truncate() to remove decimal place | progress bar label is initiate with double
                                child: Text(
                                    (steps * 1000).truncate().toString() +
                                        " STEPS",
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ),
                          ]),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //////////////////////////////////////////////////// POINTS ////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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

                        final data =
                            snapshot.requireData; // take data from the snapshot

                        point = data.docs[0]['points'];

                        return ButtonTheme(
                          minWidth: 330.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: null,
                            child: Text('Points: ' + point.toString(),
                                style: TextStyle(fontSize: 18)), // text
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(130, 40),
                                primary: Color(0xFFA7C474),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(500))),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              //////////////////////////////////////////////////// CHATBOT ////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(270, 0, 0, 10),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatBot(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/chatbotLogo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //////////////////////////////////////////////////// BELOW POINTS ////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Rewards Available',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(160, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text("See All",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            onTap: () async {
                              // go to
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllVoucherWidget(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF656565),
              ),
              //////////////////////////////////////////////////// VOUCHERS ////////////////////////////////////////////////////
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    scrollDirection: Axis.vertical,
                    // 4 items only, so 4
                    // this # must be <= to the total
                    // num of voucher ava
                    children: List.generate(4, (index) {
                      return Center(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: voucher,
                              builder: (
                                BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot,
                              ) {
                                if (snapshot.hasError) {
                                  return const Text('Something went wrong');
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text('Loading');
                                }

                                DocumentSnapshot data =
                                    snapshot.data!.docs[index];

                                var voucherDocumentID =
                                    snapshot.data!.docs[index].reference.id;

                                return InkWell(
                                  onTap: () async {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VoucherRedemptionWidget(
                                                    voucherDocumentID)));
                                    // TEST IF IT CAN GET THEIR ID - YES
                                    // ignore: avoid_print
                                    print(voucherDocumentID);
                                  },
                                  child: Image.network(
                                    '${data['image']}',
                                    width: 180,
                                    height: 200,
                                    fit: BoxFit.fitWidth,
                                  ),
                                );
                              }));
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = (await BarcodeScanner.scan()) as String;
      setState(() => this.barcode = barcode);
      if (kDebugMode) {
        print("scanned sucsessfully");
      }
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
}
