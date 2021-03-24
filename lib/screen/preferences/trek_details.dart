import 'package:flutter/material.dart';
// import 'package:gokullu/SignUp/emergency.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/preferences/widget/header_image.dart';
import 'package:gokullu/screen/trek_menu/widget/trek_info.dart';

class TrekDetails extends StatelessWidget {
  final int index;

  TrekDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 0),
            HeaderImage(index: index),
            //NameAndNumber(index: index),
            TrekInfo(index: index),
            // SizedBox(height: 10),

            // Container(
            //   padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
            //   child: Row(children: <Widget>[
            //     Expanded(
            //       child: Button(
            //         title: 'How to Reach Kullu',
            //         press: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) {
            //                 return EmergencyDetails();
            //               },
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ]),
            //   // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            //   // child: RoundButton(
            //   //   title: 'Proceed to Start Trek',
            //   //   press: () {},
            // ),
            SizedBox(height: 15),

            //Start Trek Button

            // Container(
            //   padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
            //   child: Row(children: <Widget>[
            //     Expanded(
            //       child: Button(
            //         title: 'Start Trek',
            //         press: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) {
            //                 return AboutApp();
            //               },
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ]),
            //   // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            //   // child: RoundButton(
            //   //   title: 'Proceed to Start Trek',
            //   //   press: () {},
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back',
        child: Icon(Icons.arrow_back_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      title: Text(
        'Trek Details',
        style: TextStyle(
          color: mPrimaryTextColor,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: mPrimaryTextColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
