import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:r3grow/Event/eventDetails.dart';
import 'data.dart';
import 'date_model.dart';
import 'events_model.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<DateModel> dates = <DateModel>[];
  List<EventsModel> events = <EventsModel>[];

  String todayDateIs = DateTime.now().day.toString();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dates = getDates();
    events = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: const Color(0xFFF8F4EC)),
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
                          children: const <Widget>[
                            Text(
                              "Hello, There!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
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

                    // /// Events
                    // SizedBox(height: 16,),
                    // Text("All Events", style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 20
                    // ),),

                    /// Current Events
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Current Events",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: events.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PopularEventTile(
                              desc: events[index].desc,
                              date: events[index].date,
                              address: events[index].address,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "test",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Container(
                      child: ElevatedButton(
                        child: const Text('event details'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventDetailsWidget(todayDateIs)),
                          );
                        },
                      ),
                    )
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

class DateTile extends StatelessWidget {
  String weekDay;
  String date;
  bool isSelected;
  DateTile(
      {required this.weekDay, required this.date, required this.isSelected});

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

class PopularEventTile extends StatelessWidget {
  String desc;
  String date;
  String address;
  PopularEventTile(
      {Key? key, required this.address, required this.date, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: const Color(0xff29404E),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/calender.png",
                        height: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        date,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/location.png",
                        height: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        address,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
