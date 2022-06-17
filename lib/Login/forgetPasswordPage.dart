// ignore: file_names
// ignore: file_names
// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names, duplicate_ignore
import 'package:flutter/material.dart';

class ForgetPasswordPageWidget extends StatefulWidget {
  const ForgetPasswordPageWidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageWidgetState createState() =>
      _ForgetPasswordPageWidgetState();
}

class _ForgetPasswordPageWidgetState extends State<ForgetPasswordPageWidget> {
  late TextEditingController emailController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    //email address text field
    final emailAddress = Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextFormField(
              controller: emailController,
              // onChanged: (_) => EasyDebounce.debounce(
              //   'textController2',
              //   Duration(milliseconds: 2000),
              //   () => setState(() {}),
              // ),
              autofocus: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please enter your email");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Email Address',
                enabledBorder: OutlineInputBorder(
                  // ignore: prefer_const_constructors
                  borderSide: BorderSide(
                    // ignore: prefer_const_constructors
                    color: Color(0xFFBDBDBDBD),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  // ignore: prefer_const_constructors
                  borderSide: BorderSide(
                    // ignore: prefer_const_constructors
                    color: Color(0xFFBDBDBDBD),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // ignore: prefer_const_constructors
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );

    //reset password button
    final resetPasswordBtt = Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 300),
      child: ElevatedButton(
        onPressed: () {},
        // ignore: prefer_const_constructors
        child: Text(
          "Reset Password",
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // ignore: prefer_const_constructors
          primary: Color(0xFF00e5FF),
        ),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        // ignore: prefer_const_constructors
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          // ignore: prefer_const_constructors
          backgroundColor: Color(0xFFF1FDFB),
          // ignore: prefer_const_constructors
          iconTheme: IconThemeData(color: Color(0xFF212121)),
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                // ignore: prefer_const_constructors
                padding: EdgeInsetsDirectional.fromSTEB(42, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 12),
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Back',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                // ignore: prefer_const_constructors
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                // ignore: prefer_const_constructors
                child: Text(
                  'Forget Password',
                  // ignore: prefer_const_constructors
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
                          // ignore: prefer_const_constructors
                          padding: EdgeInsetsDirectional.fromSTEB(45, 0, 0, 0),
                          // ignore: prefer_const_constructors
                          child: Text(
                            'Receive an email to rest your password:',
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
                    //Email Address text field
                    emailAddress,
                    //reset password button
                    resetPasswordBtt,
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
