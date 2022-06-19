// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/Journey/journey.dart';
import 'package:r3grow/Login/forgetPasswordPage.dart';
import 'package:r3grow/Login/signUpPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  // form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool passwordVisibility1;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility1 = false;
  }

  @override
  Widget build(BuildContext context) {
    //Email Address text field
    final emailAddress = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: emailController,
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
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
              onSaved: (value) {
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
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
    );

    //Password text field
    final passwordUser = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: passwordController,
              // onChanged: (_) => EasyDebounce.debounce(
              //   'textController2',
              //   Duration(milliseconds: 2000),
              //   () => setState(() {}),
              // ),
              autofocus: false,
              obscureText: !passwordVisibility1,
              // ignore: missing_return, body_might_complete_normally_nullable
              validator: (value) {
                RegExp regEx = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Please enter password");
                }

                if (!regEx.hasMatch(value)) {
                  return ("Please enter valid password(Min. 6 character)");
                }
              },
              onSaved: (value) {
                passwordController.text = value!;
              },
              textInputAction: TextInputAction.done,
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
                    () => passwordVisibility1 = !passwordVisibility1,
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
    );

    //forget password button
    final forgetPasswordBtt = TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgetPasswordPageWidget()),
        );
      },
      child: Text(
        "Forgot password?",
        style: TextStyle(
            fontFamily: 'Lexend Deca',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000)),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        primary: Color(0xFFF1FDFB),
      ),
    );

    //forget password button
    final loginBtt = ElevatedButton(
      onPressed: () {
        // _auth
        //     .signInWithEmailAndPassword(
        //         email: emailController.text.trim(),
        //         password: passwordController.text.trim())
        //     .then((_) {
        //   Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (context) => HomePageWidget()));
        // });
        signIn(emailController.text.trim(), passwordController.text.trim());
      },
      child: const Text(
        "LOGIN",
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
    );

    //create account button
    final createAccountBtt = TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPageWidget()),
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
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          primary: Color(0xFFF1FDFB)),
    );

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
                  child: Form(
                    key: _formKey,
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
                        //Email Address text field
                        emailAddress,
                        //Password text field
                        passwordUser,
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //forget password button
                              forgetPasswordBtt,
                              //login button
                              loginBtt,
                            ],
                          ),
                        ),
                        //create account button
                        createAccountBtt,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //login function
  void signIn(String email, String password) async {
    try {
      if (_formKey.currentState!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePageWidget()))
                })
            .catchError((e) {
          emailController.clear();
          passwordController.clear();
          Fluttertoast.showToast(msg: e!.message);
        });
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //content: Text("Login Successful"),
        // ));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
