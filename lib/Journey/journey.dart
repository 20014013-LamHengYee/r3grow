// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:r3grow/Journey/allVoucher.dart';
import 'package:r3grow/Journey/voucherRedemption.dart';

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
  double step = 0.00;
  // 0.001 - 1 STEP
  // 0.025 - 25 STEP

  // POINTS
  int point = 0;

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
                          Image.asset(
                            'assets/images/achievement.png',
                            width: 30,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    // QR CODE SCANNER
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Image.asset(
                        //   'assets/images/scanner.png',
                        //   width: 30,
                        //   height: 30,
                        //   fit: BoxFit.cover,
                        // ),
                        // TEMPORARY ONLY
                        ButtonTheme(
                          child: ElevatedButton(
                            onPressed: () async {
                              step = step + 0.001;
                              point = point + 1;
                            },
                            child: Text('S' + point.toString(),
                                style: TextStyle(fontSize: 10)), // text
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(30, 30),
                                primary: Color(0xFF226E44),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(500))),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Align(
                  alignment: Alignment.lerp(
                      Alignment.topLeft, Alignment.topRight, step),
                  child: Image.asset(
                    'assets/images/hero.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // PROGRESS BAR (DETERMINATE)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: new Stack(children: <Widget>[
                        LinearProgressIndicator(
                          value: step,
                          color: Color(0xFF226E44),
                          minHeight: 15,
                          backgroundColor: Colors.green,
                        ),
                        Padding(
                          // padding between label and bar
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Align(
                            alignment: Alignment.lerp(
                                Alignment.topLeft, Alignment.topRight, step),
                            // use .truncate() to remove decimal place | progress bar label is initiate with double
                            child: Text(
                                (step * 1000).truncate().toString() + " STEPS",
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
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
                    ),
                  ],
                ),
              ),
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
                          // Text(
                          //   'See All',
                          //   style: TextStyle(
                          //       fontSize: 15,
                          //       color: Colors.grey,
                          //       fontWeight: FontWeight.w600),
                          // ),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                          'assets/images/vou.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
            icon: Icon(Icons.event),
            label: 'Events',
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
