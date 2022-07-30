// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:r3grow/ObjectIdentification/objectMain.dart';

import '../Journey/journey.dart';

class ScanObjectWidget extends StatefulWidget {
  const ScanObjectWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ScanObjectWidgetState createState() => _ScanObjectWidgetState();
}

class _ScanObjectWidgetState extends State<ScanObjectWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<CameraDescription>? cameras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: AppBar(
      //     backgroundColor: const Color(0xFFA7C474),
      //     iconTheme: IconThemeData(color: Color(0xFF212121)),
      //     automaticallyImplyLeading: false,
      //     title: Text(
      //       'Recycle Me!',
      //       style: TextStyle(
      //           fontFamily: 'Poppins', fontSize: 32, color: Color(0xFF48240C)),
      //     ),
      //     // flexibleSpace: Column(
      //     //   mainAxisSize: MainAxisSize.max,
      //     //   mainAxisAlignment: MainAxisAlignment.end,
      //     //   crossAxisAlignment: CrossAxisAlignment.start,
      //     //   children: [
      //     //     Padding(
      //     //       padding: EdgeInsetsDirectional.fromSTEB(42, 0, 2, 0),
      //     //       child: Row(
      //     //         mainAxisSize: MainAxisSize.max,
      //     //         crossAxisAlignment: CrossAxisAlignment.center,
      //     //         children: [
      //     //           Padding(
      //     //             padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 60),
      //     //             child: Text(
      //     //               'Back',
      //     //               style: TextStyle(
      //     //                 fontFamily: 'Poppins',
      //     //                 fontSize: 20,
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //   ],
      //     // ),
      //   ),
      // ),
      backgroundColor: Color(0xFFF1FDFB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Image.asset(
                  "assets/images/scanObject.png",
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(80, 40, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            '/object');
                      },
                      child: Text(
                        'Can Recycle One ~',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        primary: Color(0xFFA7C474),
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
