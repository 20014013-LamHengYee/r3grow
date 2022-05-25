// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:r3grow/Journey/allVoucher.dart';
import 'package:r3grow/Journey/voucherRedemption.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r3grow/chatbot.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   super.initState();
  // }

  // PROGRESS BAR - STEPS
  double steps;
  // 0.001 - 1 STEP
  // 0.025 - 25 STEP

  // POINTS
  int point;

  // final _firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> account =
      FirebaseFirestore.instance.collection('Account').snapshots();

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1FDFB),
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
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 280, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  BADGE ICON
                          Image.asset(
                            'assets/images/achievement.png',
                            width: 30,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////////// QR CODE SCANNER ////////////////////////////////////////////////////
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // QR CODE ICON
                        // Image.asset(
                        //   'assets/images/scanner.png',
                        //   width: 30,
                        //   height: 30,
                        //   fit: BoxFit.cover,
                        // ),
                        // TEMPORARY ONLY
                        // ButtonTheme(
                        //   child: ElevatedButton(
                        //     onPressed: () async {
                        //       step = step + 0.001;
                        //       point = point + 1;
                        //     },
                        //     child: Text('S' + point.toString(),
                        //         style: TextStyle(fontSize: 10)), // text
                        //     style: ElevatedButton.styleFrom(
                        //         minimumSize: const Size(30, 30),
                        //         primary: Color(0xFF226E44),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(500))),
                        //   ),
                        // ),
                        // TEMPORARY ONLY | CHATBOT BUTTON
                        GestureDetector(
                          child: Text("Chatbot",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10)),
                          onTap: () async {
                            // go to
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatBot(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Hero Journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFF95F62),
                        fontWeight: FontWeight.w600),
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
                        steps = data.docs[1]['Steps'];
                        // steps = steps + 0.01; [if steps == 0.99 | because firebase if = 1 will crash.]

                        return Expanded(
                          child: Align(
                            alignment: Alignment.lerp(
                                Alignment.topLeft, Alignment.topRight, steps),
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
                        steps = data.docs[1]['Steps'];
                        // steps = steps + 0.01; [if steps == 0.99 | because firebase if = 1 will crash.]

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
                                alignment: Alignment.lerp(Alignment.topLeft,
                                    Alignment.topRight, steps),
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
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

                        point = data.docs[1]['Points'];

                        return ButtonTheme(
                          minWidth: 330.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: null,
                            child: Text('Points: ' + point.toString(),
                                style: TextStyle(fontSize: 18)), // text
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(130, 40),
                                primary: Color(0xFF226E44),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(500))),
                          ),
                        );
                      },
                    ),
                  ],
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
                      children: [
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
                                    color: Colors.grey, fontSize: 15)),
                            onTap: () async {
                              // go to
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AllVoucherWidget(),
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
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                          10, // gap between the 2 photos in each rows
                      mainAxisSpacing: 0,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/freegift.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/freedrinks.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/discount.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/upsize.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/freegift.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/freedrinks.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/discount.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const VoucherRedemptionWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/upsize.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Nearest Bin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_sharp),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Identify Object',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
