import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_project/screens/home/home_screen.dart';

import 'package:flutter_project/screens/login/login.dart';

class BTNavigationBar extends StatefulWidget {
  const BTNavigationBar({Key? key}) : super(key: key);

  @override
  _BTNavigationBarState createState() => _BTNavigationBarState();
}

class _BTNavigationBarState extends State<BTNavigationBar> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 250, 252, 253),
      selectedItemColor: Color.fromARGB(255, 12, 193, 224),
      unselectedItemColor: Color.fromARGB(179, 161, 159, 159),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      currentIndex: this._curIndex,
      /*onTap: (index) {
        this.setState(() {
          this._curIndex = index;
          switch (_curIndex) {
            case 0:
              LoginScreen();
              break;
            case 1:
              LoginScreen();
              break;
          }
        });
      },*/

      onTap: (index) => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()))
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Feed",
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chat",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          label: "Phone",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          backgroundColor: Colors.blue,
        ),
      ],
    );
  }
}
