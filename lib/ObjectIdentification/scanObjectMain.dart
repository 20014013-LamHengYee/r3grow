// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


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
      backgroundColor: const Color(0xFFF8F4EC),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Recycle Me',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF48240C),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Image.asset(
                  "assets/images/scanObject.png",
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(80, 40, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/object');
                      },
                      child: const Text(
                        'Can Recycle One ~',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        primary: const Color(0xFFA7C474),
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
