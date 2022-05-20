import 'dart:math';

import 'package:f3app/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:f3app/widget/navdraw.dart';
import 'package:f3app/theme/apptheme.dart';

//import '../widget/fitnesscard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //drawer: NavDrawer(), //Navigation Drawer Widget
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          //iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FitnessCards(),
              Progress(),
              Achievements(),
              Challenges(),
            ]),
          ),
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

Widget FitnessCards() => Padding(
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
            height: 180,
            width: 180,
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
            height: 180,
            width: 180,
            child: Text(
              'Calories Burned',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

Widget Progress() => Material(
      child: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          //Contains header and details
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(" Today's Progress",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 18),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                //Progress Boxes
                width: 300,
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
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '32',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
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
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '32',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Calories',
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

Widget Achievements() => Padding(
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
                padding: const EdgeInsets.only(top: 10, left: 5),
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
                        height: 100,
                        width: 150,
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
                        height: 100,
                        width: 150,
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
                        height: 100,
                        width: 150,
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

Widget Challenges() => Padding(
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
                      Text(" Challenges",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
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
                        height: 100,
                        width: 150,
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
                        height: 100,
                        width: 150,
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
                        height: 100,
                        width: 150,
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
