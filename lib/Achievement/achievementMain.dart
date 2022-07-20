
import 'package:flutter/cupertino.dart';
import 'package:r3grow/Achievement/badgeController.dart';
import 'package:r3grow/main.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:r3grow/Journey/allVoucher.dart';
import 'package:r3grow/Journey/scanner.dart';
import 'package:r3grow/Journey/voucherRedemption.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r3grow/Account/accountPage.dart';
import 'package:r3grow/Map/map.dart';
import '../Journey/journey.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({Key? key}) : super(key: key);

  @override
  _AchievementPageState createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  //final _badgeController = BadgeController();

  late double steps;
  String userBadge = 'noBadge.png';
  String badgeName = 'Badges yet to unlock!';

  

  final Stream<QuerySnapshot> account = FirebaseFirestore.instance
      .collection('users')
      .where("email",
          isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
      .snapshots();

    //get 
  // Future getDoc() async {
  //   await FirebaseFirestore.instance.collection('users').get().then(
  //     (snapshot) =>snapshot.docs.forEach((document) {
  //       print(document.reference);
  //       points = document.reference.collection('points').toString();
  //       print(points);
  //     }),);
  // }

  final  _bList = [
    'assets/images/1badge.png',
    'assets/images/2badge.png',
    'assets/images/3badge.png',
    'assets/images/4badge.png',
    'assets/images/5badge.png',
    'assets/images/6badge.png',
    'assets/images/7badge.png',
    'assets/images/8badge.png',
    'assets/images/9badge.png',
    'assets/images/10badge.png',
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2CBC9C),
          automaticallyImplyLeading: false,
          title: const Text('Achievements'),
          centerTitle: true,
          shadowColor: Colors.greenAccent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left,
                color: Colors.white, size: 30),
          ),
          // actions: <Widget> [
          //    IconButton(
          //     icon: const Icon(Icons.arrow_forward_rounded),
          //       onPressed: () {
          //       Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const HomePageWidget()),
          //       );
          //     },
          // ),
          // ],
        ),
        body: Column(
          children: [
            //message
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Your current badge level',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                      stream: account,
                      builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,) 
                      {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading');
                        }

                        final data =
                            snapshot.requireData; // take data from the snapshot
                        steps = (data.docs[0]['steps']).toDouble();

                        if(steps >= 100 && steps < 200){
                          userBadge = '1badge.png';
                          badgeName = 'Seedly';
                        }
                        else if(steps >= 200 && steps < 300){
                          userBadge = '2badge.png';
                          badgeName = 'Grower';
                        }
                        else if(steps >= 300 && steps < 400){
                          userBadge = '3badge.png';
                          badgeName = 'Veteran';
                        }
                        else if(steps >= 400 && steps < 500){
                          userBadge = '4badge.png';
                          badgeName = 'Elite';
                        }
                        else if(steps >= 500 && steps < 600){
                          userBadge = '5badge.png';
                          badgeName = 'Master';
                        }
                        else if(steps >= 600 && steps < 700){
                          userBadge = '6badge.png';
                          badgeName = 'Grandmaster';
                        }
                        else if(steps >=700 && steps < 800){
                          userBadge = '7badge.png';
                          badgeName = 'Legend';
                        }
                        else if(steps >= 800 && steps < 900){
                          userBadge = '8badge.png';
                          badgeName = 'Guardian';
                        }
                        else if(steps >= 900 && steps < 1000){
                          userBadge = '9badge.png';
                          badgeName = 'Fairy';
                        }
                        else if(steps >= 1000){
                          userBadge = '10badge.png';
                          badgeName = 'Hero';
                        }
      

                        return Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Container(
                              height: 200,
                              width: 200,
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/${userBadge}'),
                                backgroundColor: Colors.transparent,
                                radius: 80,
                              )),
                        );
                        
                        }
              ),
            //badge name
             Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                '$badgeName',
                style: TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            //badges to display
            const SizedBox(
              height: 70,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Container(
                        
                        child: 
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            backgroundImage: AssetImage(_bList[index]),
                           
                          )
                      ),
                    );
                  }),
            ),
          ], //
        ));
  }
}

class Badges {
  String image = "";
  //String name = "";
} // class ends here

// class BadgeWidget extends StatelessWidget {
//   final String image ;
//   final VoidCallback onClicked;

//    const BadgeWidget({
//     Key? key,
//     required this.onClicked,
//      required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final color = Theme.of(context).colorScheme.primary;

//     return Center(
//       child: buildImage(),

//     );
//   }

//   Widget buildImage() {
//     final image = Image.asset('assets/images/noBadge.png');

//     return ClipOval(
//       child: Material(
//         color: Colors.transparent,
//         child: Ink.image(
//           image: image.image ,
//           fit: BoxFit.cover,
//           width: 128,
//           height: 128,
//           child: InkWell(onTap: onClicked),
//         ),
//       ),
//     );
//   }
// }

// //widgit for display all badges
// class badgeDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: 3,
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Container(
//               color: Colors.grey[200],
//             ),
//           );
//         });
//   }
// }
