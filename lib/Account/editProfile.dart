// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/databaseModel/user_model.dart';
import 'package:r3grow/bottomNavigatorBar.dart';

class EditProfilePageWidget extends StatefulWidget {
  final UserModel currentUser;
  EditProfilePageWidget({required this.currentUser});

  @override
  _EditProfilePageWidgetState createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserModel user = UserModel();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    userNameController.text = widget.currentUser.username!;
    emailAddressController.text = widget.currentUser.email!;
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //profilePic field
    final profilePic = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFDBE2E7),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: Container(
              width: 90,
              height: 90,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/anonymousProfile.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ],
    );

    //changePhotoBtt
    // final changePhotoBtt = Padding(
    //   padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       ElevatedButton(
    //         onPressed: () {
    //           //
    //         },
    //         child: Text(
    //           "Change Photo",
    //           style: TextStyle(
    //               fontFamily: 'Poppins',
    //               fontSize: 17,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white),
    //         ),
    //         style: ElevatedButton.styleFrom(
    //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //           primary: Color(0xFFA7C474),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    //userName field
    final userName = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: TextFormField(
                controller: userNameController,
                autofocus: false,
                keyboardType: TextInputType.name,
                obscureText: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Username',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBDBDBDBD),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBDBDBDBD),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: TextStyle(fontFamily: "Poppins"),
              ),
            ),
          ),
        ],
      ),
    );

    //emailAddress field
    final emailAddress = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: TextFormField(
                controller: emailAddressController,
                // onChanged: (_) => EasyDebounce.debounce(
                //   'textController2',
                //   Duration(milliseconds: 2000),
                //   () => setState(() {}),
                // ),
                autofocus: true,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBDBDBDBD),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBDBDBDBD),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: TextStyle(fontFamily: "Poppins"),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ],
      ),
    );

    //cancelBtt
    final cancelBtt = ElevatedButton(
      onPressed: () {
        // print('Button pressed ...');
      },
      child: Text(
        "Cancel",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        primary: Color(0xFFA7C474),
      ),
    );

    //saveBtt
    final saveBtt = ElevatedButton(
      onPressed: () {
        // user.username = userNameController.text;
        // final uid = user.uid;
        // Navigator.of(context).pop();
        if (widget.currentUser.username != userNameController.text) {
          final user = UserModel(
              uid: widget.currentUser.uid,
              email: widget.currentUser.email,
              username: userNameController.text);
          updateUser(user);
        }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavigatorBar()));
      },
      child: Text(
        "Save",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        primary: Color(0xFFA7C474),
      ),
    );

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
                  'Edit Profile',
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  profilePic,
                  // changePhotoBtt,
                  userName,
                  emailAddress,
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cancelBtt,
                        saveBtt,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future updateUser(UserModel user) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    await docUser.update(user.toMap());
  }
}
