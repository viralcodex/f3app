import 'package:f3app/main.dart';
import 'package:f3app/pages/store.dart';
import 'package:f3app/pages/user.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imgUrl =
        "https://avatars.githubusercontent.com/u/79330197?s=400&u=fa3724c3eb574a0feb068a3f63acffa663676318&v=4";
    return Drawer(
      child: Material(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            SizedBox(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: NetworkImage(_imgUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Aviral Shukla",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        "aviral.shukla2122000@gmail.com",
                        style: TextStyle(
                          color: Color(0xfff7f7f7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color(0xFFF5F5F5),
              thickness: 1.1,
            ),
            InkWell(
              child: ListTile(
                onTap: () => selectedItem(context, 0),
                leading: Icon(Icons.person),
                iconColor: Colors.white,
                horizontalTitleGap: 4,
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () => selectedItem(context, 1),
                leading: Icon(Icons.money),
                iconColor: Colors.white,
                horizontalTitleGap: 4,
                title: Text(
                  "Rewards",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () => selectedItem(context, 2),
                leading: Icon(Icons.shopping_basket),
                iconColor: Colors.white,
                horizontalTitleGap: 4,
                title: Text(
                  "Purchases",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () => selectedItem(context, 3),
                leading: Icon(Icons.fitness_center),
                iconColor: Colors.white,
                horizontalTitleGap: 4,
                title: Text(
                  "Fitness History",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                onTap: () => selectedItem(context, 4),
                leading: Icon(Icons.settings),
                iconColor: Colors.white,
                horizontalTitleGap: 4,
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
      
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserPage(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StorePage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StorePage(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StorePage(),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserPage(),
          ),
        );
        break;
    }
  }
}
