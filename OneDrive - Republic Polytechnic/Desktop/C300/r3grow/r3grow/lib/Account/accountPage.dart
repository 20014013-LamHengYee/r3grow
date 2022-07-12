// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/Journey/journey.dart';
import 'package:r3grow/Journey/scanner.dart';
import 'package:r3grow/Login/LoginPage.dart';
import 'package:r3grow/databaseModel/user_model.dart';

// ignore: camel_case_types
class accountPageWidget extends StatefulWidget {
  const accountPageWidget({Key? key}) : super(key: key);

  @override
  _accountPageWidgetState createState() => _accountPageWidgetState();
}

// ignore: camel_case_types
class _accountPageWidgetState extends State<accountPageWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userLogIn = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.userLogIn = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //profile pic field
    final profilePic = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/images/anonymousProfile.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    // username field
    final username = Text(
      'Username',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28,
      ),
    );

    // email address field
    final emailAddress = Text(
      'username@gmail.com',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    );

    // accountSettings
    final accountSettings = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: Text(
              'Account Settings',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );

    //redeemedHistory
    final redeemedHistory = Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF1FDFB),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF9E9E9E),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Redeem History',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.82, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomePageWidget()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF95A1AC),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    //EditProfile
    final editProfile = Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF1FDFB),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF9E9E9E),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.86, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomePageWidget()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF95A1AC),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    //TwoFactorA
    final twoFactorA = Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF1FDFB),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF9E9E9E),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Two Factor Authentication',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.75, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                HomePageWidget()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF95A1AC),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    //LogOutBtt
    final logOutBtt = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              logOut(context);
            },
            child: const Text(
              "LOG OUT",
              style: TextStyle(
                fontFamily: 'Lexend Deca',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              primary: Color(0xFF00e5FF),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1FDFB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      profilePic,
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            username,
                            emailAddress,
                          ],
                        ),
                      ),
                    ],
                  ),
                  accountSettings,
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      redeemedHistory,
                      editProfile,
                      twoFactorA,
                    ],
                  ),
                  logOutBtt,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPageWidget()));
  }
}
