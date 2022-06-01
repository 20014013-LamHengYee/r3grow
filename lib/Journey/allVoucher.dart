// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:r3grow/Journey/voucherRedemption.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllVoucherWidget extends StatefulWidget {
  const AllVoucherWidget({Key key}) : super(key: key);

  @override
  _AllVoucherWidgetState createState() => _AllVoucherWidgetState();
}

class _AllVoucherWidgetState extends State<AllVoucherWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Stream<QuerySnapshot> voucher =
      FirebaseFirestore.instance.collection('Voucher').snapshots();

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
      body: SingleChildScrollView(
        // ensure scorllable
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: voucher,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }

                  // final data = snapshot
                  //     .requireData.docs; // take data from the snapshot

                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          physics:
                              const NeverScrollableScrollPhysics(), // ensure can scroll
                          itemCount: snapshot.data.docs.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data = snapshot.data.docs[index];

                            // generate document id > so can know which voucher is selected
                            var voucherDocumentID =
                                snapshot.data.docs[index].reference.id;

                            // return Text(data['voucherDesc']);
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 20, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VoucherRedemptionWidget(
                                                          voucherDocumentID)));
                                        },
                                        child: Image.network(
                                          '${data['image']}',
                                          width: 165,
                                          height: 165,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Flexible(
                                      child: Text(
                                        '${data['voucherDesc']}\nPoints Required: ${data['voucherPoints']} points',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
