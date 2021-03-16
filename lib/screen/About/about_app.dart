import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/about/widget/header_image.dart';
import 'package:gokullu/screen/about/widget/nic.dart';
import 'widget/about.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // About(),
            // MyLinHeaderImage          // SizedBox(height: 50),
            HeaderImage(),
            SizedBox(height: 30),
            AboutText(),
            // SizedBox(height: 10),
            //Button(),

            // Container(
            //   padding: const EdgeInsets.fromLTRB(50, 4, 50, 4),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //           child: Button(
            //         title: 'How to reach Kullu',
            //         press: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) {
            //                 return KulluRoute();
            //               },
            //             ),
            //           );
            //         },
            //       )),
            //     ],
            //   ),
            // ),

            // SizedBox(height: 25),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(50, 4, 50, 4),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //           child: Button(
            //         title: 'View Treks',
            //         press: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) {
            //                 return TrekMenu();
            //               },
            //             ),
            //           );
            //         },
            //       )),
            //     ],
            //   ),
            // ),
            SizedBox(height: 100),
            DevNic(),
          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //     color: mPrimaryColor,
      //     backgroundColor: Colors.white,
      //     buttonBackgroundColor: mPrimaryColor,
      //     height: 60,
      //     items: <Widget>[
      //       Icon(Icons.home_rounded, size: 30, color: Colors.white),
      //       Icon(Icons.list_alt, size: 30, color: Colors.white),
      //       Icon(Icons.verified_user, size: 30, color: Colors.white),
      //     ],
      //     animationDuration: Duration(milliseconds: 300),
      //     animationCurve: Curves.ease,
      //     onTap: (index) {
      //       debugPrint('Current Index');
      //     }),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: mBackgroundColor,
      elevation: 5,
      centerTitle: true,
      title: Text(
        'About: Go Kullu',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: mPrimaryTextColor,
        ),
      ),
    );
  }
}
