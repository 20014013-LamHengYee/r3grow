// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:r3grow/Login/LoginPage.dart';
import 'package:r3grow/databaseModel/user_model.dart';
import 'package:r3grow/main.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({Key? key}) : super(key: key);

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  // form key
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  //editing controller
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool passwordVisibility1;
  TextEditingController confirmPasswordController = TextEditingController();
  late bool passwordVisibility2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility1 = false;
    confirmPasswordController = TextEditingController();
    passwordVisibility2 = false;
  }

  @override
  Widget build(BuildContext context) {
    //Username text field
    final username = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: TextFormField(
                controller: usernameController,
                autofocus: false,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please enter Username");
                  }
                  return null;
                },
                onSaved: (value) {
                  usernameController.text = value!;
                },
                textInputAction: TextInputAction.next,
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
    );

    //Email Address text field
    final emailAddress = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
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
              //   'textController3',
              //   Duration(milliseconds: 2000),
              //   () => setState(() {}),
              // ),
              autofocus: false,
              // ignore: body_might_complete_normally_nullable
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
              textInputAction: TextInputAction.next,
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

    //Confirm password text field
    final confirmPasswordUser = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: confirmPasswordController,
              // onChanged: (_) => EasyDebounce.debounce(
              //   'textController4',
              //   Duration(milliseconds: 2000),
              //   () => setState(() {}),
              // ),
              autofocus: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please enter your password");
                }
                if (confirmPasswordController.text != passwordController.text) {
                  return "Password don't match";
                }
                return null;
              },
              onSaved: (value) {
                confirmPasswordController.text = value!;
              },
              textInputAction: TextInputAction.done,
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
                    () => passwordVisibility2 = !passwordVisibility2,
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
    );

    //create account button
    final createAccountBtt = Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(95, 15, 0, 0),
          child: ElevatedButton(
            onPressed: () {
              signUp(emailController.text, passwordController.text);
            },
            child: const Text(
              "CREATE ACCOUNT",
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
        ),
      ],
    );

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
                    //Username text field
                    username,
                    //Email Address text field
                    emailAddress,
                    //Password text field
                    passwordUser,
                    //Confirm password text field
                    confirmPasswordUser,
                    //create account button
                    createAccountBtt,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    try {
      if (_formKey.currentState!.validate()) {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()});
      }
      //     .catchError((e) {
      //   Fluttertoast.showToast(msg: e!.message);
      // });
    } on FirebaseAuthException catch (e) {
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists!");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email!;
    userModel.uid = user.uid;
    userModel.username = usernameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully!");

   // once registered successfully go login
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPageWidget()), (route) => false);

    // add score & steps for the user
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .update({'points': 0});

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .update({'steps': 0});
  }
}
