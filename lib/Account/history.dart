// ignore_for_file: file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// fo

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String currentAcc;

  final Stream<QuerySnapshot> history =
      FirebaseFirestore.instance.collection('History').snapshots();

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
          'Redeem History',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Color(0xFF48240C),
              fontWeight: FontWeight.normal),
        ),
        // actions: const [],
        centerTitle: true,
        elevation: 5,
      ),
      // BODY
      backgroundColor: Color(0xFFF8F4EC),
      body: SingleChildScrollView(
        // ensure scorllable
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: history,
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

                  final data =
                      snapshot.requireData.docs; // take data from the snapshot

                  currentAcc = (data[0]['userid']).toString();

                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          physics:
                              const NeverScrollableScrollPhysics(), // ensure can scroll
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data = snapshot.data!.docs[index];
                            // generate document id > so can know which voucher is selected
                            // var historyDocumentID =
                            //     snapshot.data!.docs[index].reference.id;
                            // Timestamp t = data['DateR'];
                            // DateTime d = t.toDate();
                            // DateFormat formatter = DateFormat('dd/MM/yyyy');
                            // final String formattedDate = formatter.format(d);

                            if (FirebaseAuth.instance.currentUser?.uid
                                    .toString() ==
                                currentAcc) {
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
                                          // onTap: () async {
                                          //   Navigator.of(context).push(
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               VoucherRedemptionWidget(
                                          //                   historyDocumentID)));
                                          //   // TEST IF IT CAN GET THEIR ID - YES
                                          //   // ignore: avoid_print
                                          //   print(historyDocumentID);
                                          // },
                                          child: Image.network(
                                            '${data['voucherImage']}',
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
                                      child: SizedBox(
                                        width: 190,
                                        child: Text(
                                          'Date Redemeed: ${data['DateR']}\nDecription: ${data['Desc']}\nPoints Deducted: ${data['PointsDeducted']} points\nBalance Points: ${data['Balance']}',
                                          overflow: TextOverflow.clip,
                                          maxLines: 7,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                            return Text('');
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
