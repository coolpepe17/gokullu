import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/trek_menu/trek_menu.dart';
import 'package:gokullu/widget/round_button.dart';
import 'about/about_app.dart';
import 'about/widget/kulluroute.dart';

class ReachKullu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // About(),
            // MyLine(),
            // SizedBox(height: 50),
            // AbtImage(),
            SizedBox(height: 50),
            KulluRoute(),
            SizedBox(height: 20),
            //Button(),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Button(
                    title: 'Back to About App',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AboutApp();
                          },
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Button(
                    title: 'View All Treks',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TrekMenu();
                          },
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: mBackgroundColor,
      elevation: 5,
      centerTitle: true,
      title: Text(
        'How to reach Kullu',
        style: TextStyle(
          color: mPrimaryTextColor,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:gokullu/screen/about/widget/about.dart';
// import 'package:gokullu/screen/about/widget/my_line.dart';
// import 'package:gokullu/screen/about/widget/view_menu.dart';

// import 'widget/about_image.dart';

// class AboutApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Container(
//           //   decoration: BoxDecoration(
//           //     image: DecorationImage(
//           //         image: AssetImage('assets/images/trek.jpg'),
//           //         fit: BoxFit.fitHeight),
//           //   ),
//           // ),
//           Positioned(
//             left: 10,
//             right: 10,
//             bottom: 10,
//             top: 60,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(16, 6, 16, 60),
//               decoration: BoxDecoration(
//                 color: Colors.white70,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                 ),
//               ),
//               child: Column(
//                 children: <Widget>[
//                   About(),
//                   MyLine(),
//                   SizedBox(height: 50),
//                   AbtImage(),
//                   SizedBox(height: 50),
//                   AboutText(),
//                   SizedBox(height: 80),
//                   ViewTrekButton(),
//                   //Address()
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// //   AppBar buildAppBar(BuildContext context) {
// //     return AppBar(
// //       backgroundColor: mBackgroundColor,
// //       elevation: 5,
// //       centerTitle: true,
// //       title: Text(
// //         'Register your Mobile',
// //         style: TextStyle(
// //           color: mPrimaryTextColor,
// //         ),
// //       ),
// //     );
// //   }
// // }
