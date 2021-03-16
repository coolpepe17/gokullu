import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/about/widget/aboutus_header.dart';
import 'package:gokullu/screen/about/widget/aboutus_text.dart';
// import 'package:gokullu/screen/about/widget/kulluroute.dart';
import 'package:gokullu/screen/about/widget/nic.dart';
// import 'package:gokullu/screen/trek_menu/trek_menu.dart';
// import 'package:gokullu/widget/round_button.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AboutUsHeader(),
            SizedBox(height: 20),
            AboutUsText(),
            SizedBox(height: 10),
            SizedBox(height: 70),
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
        'About Us',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: mPrimaryTextColor,
        ),
      ),
    );
  }
}
