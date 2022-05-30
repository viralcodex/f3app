import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f3app/pages/challenge.dart';
import 'package:f3app/widget/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:f3app/widget/navdraw.dart';
import 'package:f3app/theme/apptheme.dart';
import '../widget/routing.dart';
// import 'steps_counter.dart2';
import '../pages/steps.dart';
//import '../widget/fitnesscard.dart';

final User user = auth.currentUser!;
final uid = user.uid;
final stepsref = FirebaseFirestore.instance.collection('steps');
final namesref = FirebaseFirestore.instance.collection('user-details');

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //drawer: NavDrawer(), //Navigation Drawer Widget
        appBar: AppBar(
          title: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: namesref.doc(uid).get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var output = snapshot.data!.data();
                var name = output!['name'];
                // print(name);
                return Text(
                  'Welcome $name',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                );
              }
              return Text('Welcome');
            }, //used to retrieve values from the database in an async manner
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          //iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(children: [
              StepsCounter(context),
              FitnessCards(context),
              Progress(context),
              Coins(context),
              Achievements(context),
              Challenges(context),
            ]),
          ),
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }

  Widget StepsCounter(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Steps();
                      // Routing(3);
                    },
                  ),
                ).then(
                  (value) => setState(() {}),
                ); //important:updates the previous page as soon as the you press back button on the next page!!
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.width * .175,
                width: MediaQuery.of(context).size.width * .925,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'START WALKING!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );

  Widget FitnessCards(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.width * .20,
              width: MediaQuery.of(context).size.width * .45,
              child: Text(
                'Steps Count',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.width * .20,
              width: MediaQuery.of(context).size.width * .45,
              child: Text(
                'Calories Burned',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );

  Widget Progress(BuildContext context) => Material(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            //Contains header and details
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(4),
                //onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      const Text("Today's Progress",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      // Icon(Icons.arrow_forward_ios_outlined, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  //Progress Boxes
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff333333),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: IntrinsicHeight(
                    //used because of vertical divider
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FutureBuilder<
                                  DocumentSnapshot<Map<String, dynamic>>>(
                                future: stepsref.doc(uid).get(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var output = snapshot.data!.data();
                                    var currsteps = output!['currSteps'];
                                    return Text(
                                      '$currsteps',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              Text(
                                'Steps',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 2,
                          color: Color(0xff333333),
                        ),
                        SizedBox(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FutureBuilder<
                                  DocumentSnapshot<Map<String, dynamic>>>(
                                future: stepsref.doc(uid).get(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var output = snapshot.data!.data();
                                    var cal = output!['calories'];
                                    double calories =
                                        double.parse(cal.toStringAsFixed(2));
                                    return Text(
                                      '$calories',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              Text(
                                'Calories (kcal)',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget Coins(BuildContext context) => Material(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.width * .3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          'Total Coins Earned',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 28),
                        ),
                      ),
                      Container(
                        //padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: FutureBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          future: stepsref.doc(uid).get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var output = snapshot.data!.data();
                              var coins = output!['coins'];
                              return Text(
                                '$coins',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.width * .175,
                      width: MediaQuery.of(context).size.width * .925,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //alignment: Alignment.topLeft,
                                child: FutureBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                  future: stepsref.doc(uid).get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var output = snapshot.data!.data();
                                      var level = output!['level'];
                                      return Text(
                                        'Level $level',
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ),
                              // Container(
                              //   child: Text('Know More'),
                              // )
                            ],
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 10),
                          //   alignment: Alignment.bottomLeft,
                          //   child: Text(
                          //       'Reach 2 coins more TODAY and upgrade to level 2',
                          //       style: TextStyle(fontSize: 12.5)),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget Achievements(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(" Achievements",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            'Achievement 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            'Achievement 2',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            'Achievement 3',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ], //children
            ),
          ),
        ),
      );

  Widget Challenges(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChallengePage();
                          // Routing(3);
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(" Challenges",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            'Challenge 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            'Challenge 2',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .35,
                          child: Text(
                            'Challenge 3',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ], //children
                    ),
                  ),
                )
              ], //children
            ),
          ),
        ),
      );
}
