// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  primary: const Color(0xFF00e5FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => LoginPageWidget()));
  }
}
