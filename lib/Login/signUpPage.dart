// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({Key key}) : super(key: key);

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  bool passwordVisibility1;
  TextEditingController textController4;
  bool passwordVisibility2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    passwordVisibility1 = false;
    textController4 = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFF1FDFB),
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
                  'Create Account',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
          elevation: 0,
        ),
      ),
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
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(28, 0, 0, 0),
                        child: Text(
                          'Filling in the information below to access the app',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                            controller: textController3,
                            // onChanged: (_) => EasyDebounce.debounce(
                            //   'textController3',
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
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: textController4,
                            // onChanged: (_) => EasyDebounce.debounce(
                            //   'textController4',
                            //   Duration(milliseconds: 2000),
                            //   () => setState(() {}),
                            // ),
                            autofocus: true,
                            obscureText: !passwordVisibility2,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
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
                                  () => passwordVisibility2 =
                                      !passwordVisibility2,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  passwordVisibility2
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(95, 15, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "CREATE ACCOUNT",
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
