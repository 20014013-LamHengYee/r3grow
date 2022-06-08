// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, file_names

import 'package:flutter/material.dart';
import 'package:r3grow/Login/signUpPage.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility1;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility1 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1FDFB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Image.asset(
                          'assets/images/LoginPage.jpg',
                          width: 380,
                          height: 280,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(130, 20, 0, 0),
                            child: Text(
                              'LOGIN',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController1,
                                // onChanged: (_) => EasyDebounce.debounce(
                                //   'textController1',
                                //   Duration(milliseconds: 2000),
                                //   () => setState(() {}),
                                // ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController2,
                                // onChanged: (_) => EasyDebounce.debounce(
                                //   'textController2',
                                //   Duration(milliseconds: 2000),
                                //   () => setState(() {}),
                                // ),
                                autofocus: true,
                                obscureText: !passwordVisibility1,
                                decoration: InputDecoration(
                                  labelText: 'Password',
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
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility1 =
                                          !passwordVisibility1,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility1
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 10, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF000000)),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                primary: Color(0xFFF1FDFB),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                primary: Color(0xFF00e5FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPageWidget()),
                          );
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212121)),
                        ),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            primary: Color(0xFFF1FDFB)),
                      ),
                    ],
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
