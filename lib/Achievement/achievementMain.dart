
// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final userSteps = FirebaseFirestore.instance
      .collection('users')
      .where("email",
          isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
      .get()
      .then((snapshot) {
    final stg = (snapshot.docs[0]['steps']).toDouble();
    return stg;
  });

  final _bList = [
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
  final _dbList = [
    'assets/images/dbadge1.png',
    'assets/images/dbadge2.png',
    'assets/images/dbadge3.png',
    'assets/images/dbadge4.png',
    'assets/images/dbadge5.png',
    'assets/images/dbadge6.png',
    'assets/images/dbadge7.png',
    'assets/images/dbadge8.png',
    'assets/images/dbadge9.png',
    'assets/images/dbadge10.png',
  ];

  final badgeNames = [
    'Seedly',
    'Grower',
    'Veteran',
    'Elite',
    'Master',
    'Grandmaster',
    'Legend',
    'Guardian',
    'Fairy',
    'Hero',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF8F4EC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFA7C474),
          automaticallyImplyLeading: false,
          title: const Text('ACHIEVEMENTS'),
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
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading');
                  }

                  final data =
                      snapshot.requireData; // take data from the snapshot
                  steps = (data.docs[0]['steps']).toDouble();
                  steps = steps * 1000;

                  int countLight = (steps ~/ 100);

                  for (int i = 0; i < countLight; i++) {
                    String image = _bList[i];
                    _dbList[i] = image;
                    userBadge = _bList[i];
                    badgeName = badgeNames[i];
                  }
                  // if(steps >= 100 && steps < 200){
                  //   userBadge = "1badge.png";
                  //   badgeName = 'Seedly';

                  // }
                  // else if(steps >= 200 && steps < 300){
                  //   userBadge = '2badge.png';
                  //   badgeName = 'Grower';

                  // }
                  // else if(steps >= 300 && steps < 400){
                  //   userBadge = '3badge.png';
                  //   badgeName = 'Veteran';

                  //   for (var i in _dbList){
                  //     _dbList[2] = 'assets/images/$userBadge';
                  //   }
                  // }
                  // else if(steps >= 400 && steps < 500){
                  //   userBadge = '4badge.png';
                  //   badgeName = 'Elite';

                  //   for (var i in _dbList){
                  //     _dbList[3] = 'assets/images/$userBadge';
                  //   }
                  // }
                  // else if(steps >= 500 && steps < 600){
                  //   userBadge = '5badge.png';
                  //   badgeName = 'Master';
                  //   //_dbList[4] = 'assets/images/$userBadge';
                  // }
                  // else if(steps >= 600 && steps < 700){
                  //   userBadge = '6badge.png';
                  //   badgeName = 'Grandmaster';

                  //   for (var i in _dbList){
                  //     _dbList[5] = 'assets/images/$userBadge';
                  //   }
                  // }
                  // else if(steps >=700 && steps < 800){
                  //   userBadge = '7badge.png';
                  //   badgeName = 'Legend';

                  //   for (var i in _dbList){
                  //     _dbList[6] = 'assets/images/$userBadge';
                  //   }
                  // }
                  // else if(steps >= 800 && steps < 900){
                  //   userBadge = '8badge.png';
                  //   badgeName = 'Guardian';

                  //   for (var i in _dbList){
                  //     _dbList[7] = 'assets/images/$userBadge';
                  //   }
                  // }
                  // else if(steps >= 900 && steps < 1000){
                  //   userBadge = '9badge.png';
                  //   badgeName = 'Fairy';

                  //   for (var i in _dbList){
                  //     _dbList[8] = 'assets/images/$userBadge';
                  //   }
                  // }
                  // else if(steps >= 1000){
                  //   userBadge = '10badge.png';
                  //   badgeName = 'Hero';

                  //   for (var i in _dbList){
                  //     _dbList[9] = 'assets/images/$userBadge';
                  //   }
                  // }
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                            height: 200,
                            width: 200,
                            //alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                //backgroundImage: AssetImage(Image.asset('assets/images/$userBadge').toString()),
                                child: Image.asset(userBadge),
                                backgroundColor: Colors.transparent,
                                radius: 80,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            badgeName,
                            style: const TextStyle(
                              color: Colors.black, 
                              fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Badges your have obtained',
                            style: TextStyle(
                              color: Colors.grey, 
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                mainAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(3, 0, 3, 0),
                                  // ignore: avoid_unnecessary_containers
                                  child: Container(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        backgroundImage: AssetImage(_dbList[index]),
                                    )
                                  ),
                                );
                              }),
                        )
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // Expanded(
                        //   child: SizedBox(
                        //     height: 100,
                        //     child: GridView.builder(
                        //       itemCount: 10,
                        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 5,
                        //         mainAxisSpacing: 20,
                        //         crossAxisSpacing: 5,
                        //       ),
                        //       itemBuilder: (context, index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        //           child: Container(
                        //               child: CircleAvatar(
                        //             backgroundColor: Colors.blue,
                        //             backgroundImage: AssetImage(_dbList[index]),
                        //           )),
                        //         );
                        //       }),)
                        // child: GridView.builder(
                        //     itemCount: 10,
                        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 5,
                        //       mainAxisSpacing: 20,
                        //       crossAxisSpacing: 5,
                        //     ),
                        //     itemBuilder: (context, index) {
                        //       return Padding(
                        //         padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        //         child: Container(
                        //             child: CircleAvatar(
                        //           backgroundColor: Colors.blue,
                        //           backgroundImage: AssetImage(_dbList[index]),
                        //         )),
                        //       );
                        //     }),
                        // ),
                      ],
                    ),
                  );
                }),
            // //badge name
            //  Padding(
            //   padding: EdgeInsets.all(5.0),
            //   child: Text(

            //     '$badgeName',
            //     style: TextStyle(color: Colors.black, fontSize: 20),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            //badges to display
            // const SizedBox(
            //   height: 30,
            // ),
            // Expanded(
            //   child: GridView.builder(
            //       itemCount: 10,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 5,
            //         mainAxisSpacing: 20,
            //         crossAxisSpacing: 5,
            //       ),
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
            //           child: Container(
            //               child: CircleAvatar(
            //             backgroundColor: Colors.blue,
            //             backgroundImage: AssetImage(_dbList[index]),
            //           )),
            //         );
            //       }),
            // ),
          ], //
        ));
  }

  // Future<Widget> _getImage(BuildContext context, String imageName) async {
  //   Image image;
  //   await FireStorageService.loadImage(context, imageName).then((value) {
  //     image = Image.network(
  //       value.toString(),
  //       fit: BoxFit.scaleDown
  //     );
  //     return image;
  //   }
  //   );

  // }

}//

// class Badges {
//   String image = "";
// } // class ends here

// class FireStorageService extends ChangeNotifier{
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String Image) async{
//     return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//   }
// }
