// ignore_for_file: avoid_print, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class VoucherRedemptionWidget extends StatefulWidget {
  const VoucherRedemptionWidget({Key key}) : super(key: key);

  @override
  _VoucherRedemptionWidgetState createState() =>
      _VoucherRedemptionWidgetState();
}

class _VoucherRedemptionWidgetState extends State<VoucherRedemptionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int points = 100;
  int voucherPoints = 50;
  int pointsUpdated;
  int numOfVoucher = 1;
  int numOfVoucherBalance;

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
                      Image.asset(
                        'assets/images/freegift.png',
                        width: 300,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       'assets/images/vou.png',
                //       width: 300,
                //       height: 150,
                //       fit: BoxFit.cover,
                //     ),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
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
                              '50 points',
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
                            '18 Apr 2022 to 01 May 2022',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Enjoy a FREE upsize of any drinks when you purchase from Liho!',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '- condition 1\n- condition 2\n- condition 3',
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
                ButtonTheme(
                  minWidth: 130,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      // print('Button pressed ...');
                      Widget yesButton = TextButton(
                        child: Text("YES"),
                        onPressed: () async {
                          if (points >= voucherPoints) {
                            numOfVoucherBalance =
                                numOfVoucher - 1; // not refreshing well.
                            if (numOfVoucherBalance != -1) {
                              points = points - voucherPoints;
                              print("#: " + numOfVoucherBalance.toString());

                              Widget okButton = TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  //   Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => VoucherRedemptionWidget()
                                  //   )
                                  // );
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
                                content:
                                    Text("This voucher is fully redeemed."),
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
                        style: TextStyle(fontSize: 18)), // text
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 40),
                        primary: Color(0xFF226E44),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
