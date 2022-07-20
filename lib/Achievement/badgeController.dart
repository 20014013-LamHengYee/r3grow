import 'package:r3grow/Journey/journey.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r3grow/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetUserPoints extends StatelessWidget{
    final String docId;

    GetUserPoints({required this.docId});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = 
            snapshot.data!.data() as Map<String, dynamic>;
            return Text('Points: ${data['points']}');
      }
      return Text('loading....');
    }));
  }

    // String userBadge = 'noBadge.png';
    // String badgeName = 'Badges yet to unlock!';
  
  //double? userSteps = 0;
  
  // final Stream<QuerySnapshot> account = FirebaseFirestore.instance
  //     .collection('users')
  //     .where("email",
  //         isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
  //     .snapshots();


  // Future<QuerySnapshot> temp = FirebaseFirestore.instance
  //   .collection('users')
  //   .where("email",
  //       isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
  //   .get();

  
    // final userSteps = FirebaseFirestore.instance
    //   .collection('users')
    //   .where("email",
    //       isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
    //   .get()
    //   .then((snapshot) {
    //     final stg = (snapshot.docs[0]['steps']).toDouble();
    //     return stg;
    //   });

    //   badgeCounter(){
    //     double? steps = userSteps as double;   //casting to double 
    //     if(steps >= 100 && steps < 200){
    //       userBadge = '1badge.png';
    //       badgeName = 'Seedly';
    //     }
    //     else if(steps >= 200 && steps < 300){
    //       userBadge = '2badge.png';
    //       badgeName = 'Grower';
    //     }
    //     else if(steps >= 300 && steps < 400){
    //       userBadge = '3badge.png';
    //       badgeName = 'Veteran';
    //     }
    //     else if(steps >= 400 && steps < 500){
    //       userBadge = '4badge.png';
    //       badgeName = 'Elite';
    //     }
    //     else if(steps >= 500 && steps < 600){
    //       userBadge = '5badge.png';
    //       badgeName = 'Master';
    //     }
    //     else if(steps >= 600 && steps < 700){
    //       userBadge = '6badge.png';
    //       badgeName = 'Grandmaster';
    //     }
    //     else if(steps >=700 && steps < 800){
    //       userBadge = '7badge.png';
    //       badgeName = 'Legend';
    //     }
    //     else if(steps >= 800 && steps < 900){
    //       userBadge = '8badge.png';
    //       badgeName = 'Guardian';
    //     }
    //     else if(steps >= 900 && steps < 1000){
    //       userBadge = '9badge.png';
    //       badgeName = 'Fairy';
    //     }
    //     else if(steps >= 1000){
    //       userBadge = '10badge.png';
    //       badgeName = 'Hero';
    //     }
    //   }

}//