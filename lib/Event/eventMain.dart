// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:r3grow/Event/eventDetails.dart';
import '../databaseModel/user_model.dart';
import 'data.dart';
import 'date_model.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<DateModel> dates = <DateModel>[];
  List<String> numEvent = [];

  String todayDateIs = DateTime.now().day.toString();

  final Stream<QuerySnapshot> event =
      FirebaseFirestore.instance.collection('Event').snapshots();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel userLogIn = UserModel();

  late String desc;
  late String date;
  late String address;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    dates = getDates();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.userLogIn = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Color(0xFFF8F4EC)),
            ),
            SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello, There ${userLogIn.username}!",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Let's explore what’s happening",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    /// Dates
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 60,
                      child: ListView.builder(
                          itemCount: dates.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return DateTile(
                              weekDay: dates[index].weekDay,
                              date: dates[index].date,
                              isSelected: todayDateIs == dates[index].date,
                            );
                          }),
                    ),

                    /// Current Events
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Upcoming Events",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: event,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot,
                          ) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text('Loading');
                            }
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              desc =
                                  "There are no upcoming events at the moment  :(";
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 100,
                                  width: 400,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff29404E),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Text(
                                      desc,
                                      style: const TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }

                            final getData = snapshot
                                .requireData; // take data from the snapshot

                            return (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot data =
                                          snapshot.data!.docs[index];
                                      desc = getData.docs[index]['Name'];
                                      date = getData.docs[index]['eventDate'];
                                      address = getData.docs[index]['Location'];

                                      // DocumentSnapshot data =
                                      //     snapshot.data!.docs[index];

                                      var eventDocId = snapshot
                                          .data!.docs[index].reference.id;

                                      return Container(
                                          height: 110,
                                          margin:
                                              const EdgeInsets.only(bottom: 18),
                                          decoration: BoxDecoration(
                                              color: const Color(0xff29404E),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: InkWell(
                                            onTap: () async {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EventDetailsWidget(
                                                              eventDocId)));
                                            },
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10,
                                                        top: 8,
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              110,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            desc,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    3, 0, 0, 5),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Image.asset(
                                                                  "assets/images/calender.png",
                                                                  height: 13,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  date,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Image.asset(
                                                                  "assets/images/location.png",
                                                                  height: 13,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  address,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10.5),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ))),
                                              ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8)),
                                                  child: Image.network(
                                                    '${data['image']}',
                                                    height: 110,
                                                    width: 120,
                                                    fit: BoxFit.cover,
                                                  )),
                                            ]),
                                          ));
                                    });
                            //);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DateTile extends StatelessWidget {
  String weekDay;
  String date;
  bool isSelected;
  DateTile(
      {Key? key,
      required this.weekDay,
      required this.date,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFCCD00) : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            date,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            weekDay,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
