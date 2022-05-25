import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1FDFB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                        width: 393,
                        height: 320,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
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
                              obscureText: false,
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
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Forgot password?"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 40),
                              primary: Color(0xFFF1FDFB),
                              textStyle: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("LOGIN"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 130, vertical: 50),
                              primary: Color(0xFFF1FDFB),
                              textStyle: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Create Account"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 170, vertical: 40),
                        primary: Color(0xFFF1FDFB),
                        textStyle: const TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
