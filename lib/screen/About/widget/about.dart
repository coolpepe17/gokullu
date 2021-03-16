import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
// import 'package:flutter_coffee/screen/main/widget/icon_text.dart';

// class About extends StatelessWidget {
//   const About({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'About App',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: mPrimaryTextColor,
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

class AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'The App Provides Registration of Trekkers and Trek their GPS Location which is helpful to locate the trekkers in case of any Emergncy ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mTitleTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
