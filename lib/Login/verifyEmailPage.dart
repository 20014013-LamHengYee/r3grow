// ignore: file_names
import 'package:flutter/material.dart';

class VerifyEmailPageWidget extends StatefulWidget {
  const VerifyEmailPageWidget({Key? key}) : super(key: key);

  @override
  _VerifyEmailPageWidgetState createState() => _VerifyEmailPageWidgetState();
}

class _VerifyEmailPageWidgetState extends State<VerifyEmailPageWidget> {
  final formKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      children: [],
                    ),
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
