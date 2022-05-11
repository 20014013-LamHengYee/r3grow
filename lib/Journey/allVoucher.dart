// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r3grow/Journey/voucherRedemption.dart';

class AllVoucherWidget extends StatefulWidget {
  const AllVoucherWidget({Key key}) : super(key: key);

  @override
  _AllVoucherWidgetState createState() => _AllVoucherWidgetState();
}

class _AllVoucherWidgetState extends State<AllVoucherWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left,
              color: Colors.grey, size: 40),
        ),
        title: const Text(
          'All Vouchers',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Color(0xFF226E44),
              fontWeight: FontWeight.w600),
        ),
        // actions: const [],
        centerTitle: true,
        elevation: 5,
      ),
      // BODY
      backgroundColor: const Color(0xFFF1FDFB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Image.asset(
                        'assets/images/WhatsApp_Image_2022-04-27_at_11.57.02_AM.jpeg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        '(name of voucher)\n\nPoints Required: 50 points',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
