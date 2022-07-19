// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:r3grow/Journey/allVoucher.dart';
import 'package:r3grow/Journey/journey.dart';
import 'package:r3grow/Account/accountPage.dart';
import 'package:r3grow/Map/map.dart';
import 'package:r3grow/chatbot/chatbot.dart';


import 'Event/eventMain.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({Key? key}) : super(key: key);

  @override
  _BottomNavigatorBarState createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _selectedIndex = 2;
  static const List<Widget> _widgetOptions = <Widget>[
    // ignore: curly_braces_in_flow_control_structures
    MapPageWidget(),
    AllVoucherWidget(),
    HomePageWidget(),
    //ChatBot(),
    //EventPage(),
    accountPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
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
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
