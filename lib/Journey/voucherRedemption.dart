// ignore_for_file: avoid_print, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_this, no_logic_in_create_state

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for the date
import 'package:firebase_auth/firebase_auth.dart';

class VoucherRedemptionWidget extends StatefulWidget {
  // passed from allVoucher.dart / journey.dart
  String voucherDocumentID;
  VoucherRedemptionWidget(this.voucherDocumentID, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VoucherRedemptionWidgetState(this.voucherDocumentID);
  }
}

class _VoucherRedemptionWidgetState extends State<VoucherRedemptionWidget> {
  String voucherDocumentID;
  _VoucherRedemptionWidgetState(this.voucherDocumentID);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late int points;
  late int voucherPoints;
  late int pointsUpdated;
  late int numOfVoucher;
  late int numOfVoucherBalance;

  final Stream<QuerySnapshot> voucher =
      FirebaseFirestore.instance.collection('Voucher').snapshots();

  final Stream<QuerySnapshot> account = FirebaseFirestore.instance
      .collection('users')
      .where("email",
          isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left,
              color: Colors.grey, size: 40),
        ),
        title: const Text(
          'Redeem Vouchers',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Color(0xFF226E44),
              fontWeight: FontWeight.w600),
        ),
        // actions: const [],
        centerTitle: true,
        elevation: 5,
      ),
      backgroundColor: const Color(0xFFF1FDFB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('Voucher')
                              .doc(
                                  voucherDocumentID) // based on specific document id.
                              .snapshots(),
                          builder: (_, snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Loading');
                            }

                            final data = snapshot
                                .requireData; // take data from the snapshot

                            return Image.network(
                              '${data['image']}',
                              width: 300,
                              height: 220,
                              fit: BoxFit.fitWidth,
                            );
                          }),
                    ],
                  ),
                ),
                ////////////////////////////////////////////// POINTS & VALID DATE //////////////////////////////////////////////
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 25, 0, 30),
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('Voucher')
                          .doc(
                              voucherDocumentID) // based on specific document id.
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading');
                        }
                        final data =
                            snapshot.requireData; // take data from the snapshot

                        // Initialise the date
                        Timestamp t = data['voucherExpiryDate'];
                        DateTime d = t.toDate();
                        DateFormat formatter = DateFormat('dd/MM/yyyy');
                        final String formattedDate = formatter
                            .format(d); // make the date into this format

                        return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                // Space between points & valid date
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 90, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Point',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${data['voucherPoints']}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Valid Date',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    formattedDate.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ]);
                      }),
                ),
                ////////////////////////////////////////////// DESCRIPTION //////////////////////////////////////////////
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('Voucher')
                          .doc(
                              voucherDocumentID) // based on specific document id.
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading');
                        }
                        final data =
                            snapshot.requireData; // take data from the snapshot

                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Description',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${data['voucherDesc']}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]);
                      }),
                ),
                ////////////////////////////////////////////// T & C //////////////////////////////////////////////
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('Voucher')
                          .doc(
                              voucherDocumentID) // based on specific document id.
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading');
                        }
                        final data =
                            snapshot.requireData; // take data from the snapshot

                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 25, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Terms & Condition',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 30),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${data['voucherTC']}',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]);
                      }),
                ),
                ////////////////////////////////////////////// BUTTON //////////////////////////////////////////////
                ButtonTheme(
                  minWidth: 130,
                  height: 40,
                  // VOUCHER
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('Voucher')
                          .doc(
                              voucherDocumentID) // based on specific document id.
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading');
                        }
                        final data =
                            snapshot.requireData; // take data from the snapshot

                        voucherPoints = data['voucherPoints'];
                        numOfVoucher = data['noOfVoucher'];

                        // ACCOUNT
                        return StreamBuilder<QuerySnapshot>(
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

                            points = data.docs[0]['points'];

                            return ElevatedButton(
                              onPressed: () async {
                                // print('Button pressed ...');
                                Widget yesButton = TextButton(
                                  child: Text("YES"),
                                  onPressed: () async {
                                    // ensure there is sufficient points
                                    if (points >= voucherPoints) {
                                      numOfVoucherBalance = numOfVoucher -
                                          1; 
                                      // UPDATE DATABASE
                                      FirebaseFirestore.instance
                                          .collection('Voucher')
                                          .doc(voucherDocumentID)
                                          .update({
                                        'noOfVoucher': numOfVoucherBalance
                                      });

                                      // ensure there is sufficient vouchers
                                      if (numOfVoucherBalance >= 0) {
                                        points = points - voucherPoints;
                                      // UPDATE DATABASE
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(FirebaseAuth.instance.currentUser?.uid.toString())
                                          .update({
                                        'points': points
                                      });


                                        Widget okButton = TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        );

                                        AlertDialog alert = AlertDialog(
                                          title: Text("Congratulation"),
                                          content: Text(
                                              "You have successfully redeem this voucher! Please use it as soon as possible."),
                                          actions: [okButton],
                                        );

                                        // show the dialog
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert;
                                          },
                                        );

                                        // Navigator.of(context).pop();
                                      } else {
                                        // NOT ENOUGH VOUCHERS
                                        Widget okButton = TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        );

                                        AlertDialog alert = AlertDialog(
                                          title: Text("Sorry"),
                                          content: Text(
                                              "This voucher is fully redeemed."),
                                          actions: [okButton],
                                        );

                                        // show the dialog
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert;
                                          },
                                        );
                                      }
                                    } else {
                                      // NOT ENOUGH POINTS
                                      Widget okButton = TextButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );

                                      AlertDialog alert = AlertDialog(
                                        title: Text("Oops"),
                                        content: Text(
                                            "You have insufficient points to redeem this voucher."),
                                        actions: [okButton],
                                      );

                                      // show the dialog
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                      // Navigator.of(context).pop();
                                    }
                                  },
                                );

                                Widget noButton = TextButton(
                                  child: Text("NO"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                );

                                // Create AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("Confirmation"),
                                  content: Text(
                                      "Are you sure you want to redeem this voucher?"),
                                  actions: [yesButton, noButton],
                                );

                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              child: const Text('Redeem',
                                  style: TextStyle(fontSize: 20)), // text
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(350, 40),
                                primary: Color(0xFF226E44),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
