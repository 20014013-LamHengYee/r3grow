// ignore: duplicate_ignore
// ignore_for_file: file_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:r3grow/Login/LoginPage.dart';
import 'package:r3grow/bottomNavigatorBar.dart';

class VerifyEmailPageWidget extends StatefulWidget {
  const VerifyEmailPageWidget({Key? key}) : super(key: key);

  @override
  _VerifyEmailPageWidgetState createState() => _VerifyEmailPageWidgetState();
}

class _VerifyEmailPageWidgetState extends State<VerifyEmailPageWidget> {
  final formKey = GlobalKey<ScaffoldState>();
  // bool isEmailVerify = false;
  final user = FirebaseAuth.instance.currentUser;
  bool canResendEmail = false;
  // bool? isEmailVerify = false;
  // bool? canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // user = _auth.currentUser;
    // user?.sendEmailVerification();
    //user needs to be created then only verify
    // if (!isEmailVerify) {
    //   //   sendVerificationLink();

    //   timer = Timer.periodic(
    //     // ignore: prefer_const_constructors
    //     Duration(seconds: 3),
    //     (_) => checkEmailVerify(),
    //   );
    // }
    // ignore: prefer_const_constructors
    // timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   checkEmailVerify();
    // });
    final user = FirebaseAuth.instance.currentUser;
    user!.sendEmailVerification();
    // ignore: prefer_const_constructors
    timer = Timer.periodic(Duration(seconds: 15), (timer) {
      checkEmailVerify();
    });
  }

  Future sendVerificationLink() async {
    try {
      user?.sendEmailVerification();

      setState(() => canResendEmail = false);
      // ignore: prefer_const_constructors
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerify() async {
    //call after email verified
    await user!.reload();

    // user = _auth.currentUser;
    // await user?.reload();

    // if (user!.emailVerified) {
    //   timer?.cancel();
    //   Navigator.of(context).pushReplacement(
    //       // ignore: prefer_const_constructors
    //       MaterialPageRoute(builder: (context) => HomePageWidget()));
    // }
    setState(() {
      user!.emailVerified;
    });

    if (user!.emailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (user?.emailVerified == true) {
      // ignore: prefer_const_constructors
      return BottomNavigatorBar();
    } else {
      //reset email button

      //cancel button
      final cancelBtt = Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              // ignore: prefer_const_constructors
              MaterialPageRoute(builder: (context) => LoginPageWidget()),
            );
          },
          // ignore: prefer_const_constructors
          child: Text(
            "OK",
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // ignore: prefer_const_constructors
            primary: Color(0xFF00e5FF),
          ),
        ),
      );

      return Scaffold(
        key: formKey,
        appBar: PreferredSize(
          // ignore: prefer_const_constructors
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            // ignore: prefer_const_constructors
            backgroundColor: Color(0xFFF1FDFB),
            // ignore: prefer_const_constructors
            iconTheme: IconThemeData(color: Color(0xFF212121)),
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Padding(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Verify Email',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
              ],
            ),
            actions: const [],
            elevation: 0,
          ),
        ),
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xFFF1FDFB),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsetsDirectional.fromSTEB(0, 160, 0, 0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Padding(
                            padding:
                                // ignore: prefer_const_constructors
                                EdgeInsetsDirectional.fromSTEB(56, 0, 0, 0),
                            // ignore: prefer_const_constructors
                            child: Text(
                              'Email verification link has been sent',
                              textAlign: TextAlign.start,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //resent email button
                      // resentEmailBtt,
                      //cancel button
                      cancelBtt,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
