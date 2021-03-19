import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gokullu/screen/About/about_app.dart';
// import 'package:gokullu/screen/About/widget/kulluroute.dart';
import 'package:gokullu/screen/about/aboutus.dart';
import 'package:gokullu/screen/about/widget/kulluroute.dart';
import 'package:gokullu/screen/trek_menu/trek_menu.dart';
// import 'package:gokullu/userscreen/home.dart';

import '../constant.dart';

// // class NavBar extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       // debugShowCheckedModeBanner: false,
// //       // title: 'Flutter Demo',
// //       home: BottomBar(),
// //     );
// //   }
// // }

// Color color = Colors.blueAccent;
// String disp = '';
// String id = 'profile_page';

// class PagesState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// PagesState createState() => _PagesState();

// _PagesState() {}

// class BottomBar extends StatefulWidget {
//   @override
//   _BottomBarState createState() => _BottomBarState();
// }

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AboutApp(),
    KulluRoute(),
    TrekMenu(),
    AboutUs(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          onTap: onTappedBar,
          index: 0,
          color: mPrimaryColor,
          backgroundColor: Colors.white,
          buttonBackgroundColor: mPrimaryColor,
          height: 55,
          animationDuration: Duration(milliseconds: 300),
          animationCurve: Curves.decelerate,
          items: <Widget>[
            Icon(Icons.home_rounded, size: 35, color: Colors.white),
            Icon(Icons.bus_alert, size: 35, color: Colors.white),
            Icon(Icons.terrain_rounded, size: 35, color: Colors.white),
            Icon(Icons.alternate_email_outlined, size: 35, color: Colors.white),
            // Icon(Icons.alternate_email_outlined, size: 30, color: Colors.white),
          ],
          // animationDuration: Duration(milliseconds: 300),
          // index: 1,
        ));
  }
}

Widget build(BuildContext context) {
  return Scaffold(
    // backgroundColor: color,
    // bottomNavigationBar: CurvedNavigationBar(
    //   height: 70,
    //   animationDuration: Duration(microseconds: 400),
    //   backgroundColor: color,
    //   items: [
    //     Icon(Icons.add),
    //     Icon(Icons.home),
    //     Icon(Icons.search),
    //   ],
    //   onTap: (index) {
    //     setState(() {
    //       if (index == 0) {
    //         disp = 'Add';
    //         color = Colors.blueGrey;
    //       } else if (index == 1) {
    //         disp = 'Home';
    //         color = Colors.pinkAccent;
    //       } else {
    //         disp = 'Search';
    //         color = Colors.deepPurple;
    //       }
    //     });
    //   },
    // ),
    body: Center(
        // child: Container(
        //   child: Text(
        //     // disp,
        //     style: TextStyle(
        //       fontSize: 50,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        ),
  );
}
