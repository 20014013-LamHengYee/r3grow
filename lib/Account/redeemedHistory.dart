// ignore_for_file: file_names, prefer_const_constructors, no_logic_in_create_state, prefer_const_constructors_in_immutables, recursive_getters, curly_braces_in_flow_control_structures, unnecessary_null_comparison, prefer_is_empty, prefer_const_literals_to_create_immutables, duplicate_ignore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RedeemHistoryPageWidget extends StatefulWidget {
  RedeemHistoryPageWidget({Key? key}) : super(key: key);

  String get voucherDocumentID => voucherDocumentID;

  @override
  _RedeemHistoryPageWidgetState createState() =>
      _RedeemHistoryPageWidgetState(voucherDocumentID);
}

class _RedeemHistoryPageWidgetState extends State<RedeemHistoryPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String voucherDocumentID;
  _RedeemHistoryPageWidgetState(this.voucherDocumentID);

  //points
  late int balancedPoints;
  //voucherPoints
  late int deductedPoints;

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFF8F4EC),
          iconTheme: IconThemeData(color: Color(0xFF212121)),
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(42, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 12),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                child: Text(
                  'History',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 32,
                      color: Color(0xFF48240C)),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFFF8F4EC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: displayUserHistory(),
          ),
        ),
      ),
    );
  }

  displayUserHistory() {
    return FutureBuilder(
        // future: getHistory(),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting)
        return Center(
          child: CircularProgressIndicator(),
        );
      else {
        var userVoucher = snapshot.data as List;
        if (userVoucher == null || userVoucher.length == 0)
          return Center(
            child: Text('Cannot load voucher history'),
          );
        else
          return ListView.builder(
              itemCount: userVoucher.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child: Column(
                    children: [
                      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection('Voucher')
                            .doc(voucherDocumentID)
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading');
                          }

                          final data = snapshot.requireData;
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      '${data['image']}',
                                      width: 150,
                                      height: 120,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    //date
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Date Redeemed : ${data['voucherExpiryDate']}'),
                                          Text(
                                              'Description : ${data['voucherExpiryDate']}'),
                                          Text(
                                              'Deducted Points : ${data['voucherExpiryDate']}'),
                                          Text(
                                              'Balanced Points : ${data['voucherExpiryDate']}'),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              });
      }
    });
  }

  // Future<List> getHistory() async {
  //   var listVoucher = new List.empty(growable: true);
  //   final Stream<QuerySnapshot> voucher =
  //       FirebaseFirestore.instance.collection('Voucher').snapshots();

  //   final Stream<QuerySnapshot> account = FirebaseFirestore.instance
  //       .collection('users')
  //       .where("email",
  //           isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
  //       .snapshots();

  //   DocumentSnapshot.docs.forEach((element)){

  //   }

  // }
}
