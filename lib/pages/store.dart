import 'package:flutter/material.dart';
import 'package:f3app/theme/apptheme.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //drawer: NavDrawer(),
        appBar: AppBar(
          title: Text(
            "Store Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Column(children: [
            Deals(context),
            Popular(context),
            TopBrands(context),
            SuperSavers(context),
            FitnessProducts(context),
            Nutrition(context),
            Wellness(context),
          ]),
        ),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

Widget Deals(BuildContext context) => Padding(
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
                      Text("Deals of the day",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Padding(
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
                            height: 100,
                            width: 120,
                            child: Text(
                              'Deal 1',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(8.0),
                            height: 100,
                            width: 120,
                            child: Text(
                              'Deal 2',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(8.0),
                            height: 100,
                            width: 120,
                            child: Text(
                              'Deal 3',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(8.0),
                            height: 100,
                            width: 120,
                            child: Text(
                              'Deal 4',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );

Widget Popular(BuildContext context) => Padding(
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
                      Text("Popular Collections",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      height: 100,
                      width: 120,
                      child: Text(
                        'Collection 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 120,
                      child: Text(
                        'Collection 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 120,
                      child: Text(
                        'Collection 3',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );

Widget TopBrands(BuildContext context) => Padding(
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
                      Text("Top Brands",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      height: 100,
                      width: 120,
                      child: Text(
                        'Brand 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 120,
                      child: Text(
                        'Brand 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 120,
                      child: Text(
                        'Brand 3',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );

Widget SuperSavers(BuildContext context) => Padding(
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
                      Text("Super Saver Deals",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      height: 100,
                      width: 120,
                      child: Text(
                        'Brand 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 120,
                      child: Text(
                        'Brand 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 120,
                      child: Text(
                        'Brand 3',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );

Widget FitnessProducts(BuildContext context) => Padding(
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
                      Text("Fitness Products",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      height: 100,
                      width: 180,
                      child: Text(
                        'Product 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 180,
                      child: Text(
                        'Product 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );

Widget Nutrition(BuildContext context) => Padding(
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
                      Text("Eat Healthy",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      height: 100,
                      width: 180,
                      child: Text(
                        'Product 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 180,
                      child: Text(
                        'Product 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );

Widget Wellness(BuildContext context) => Padding(
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
                      Text("Hygiene and Wellness",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      height: 100,
                      width: 180,
                      child: Text(
                        'Product 1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 180,
                      child: Text(
                        'Product 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ], //children
          ),
        ),
      ),
    );
