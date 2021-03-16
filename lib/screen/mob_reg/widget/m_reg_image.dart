import 'package:flutter/material.dart';
// import 'package:gokullu/constant.dart';

class MobRegImg extends StatelessWidget {
  const MobRegImg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
          child: Image.asset(
        'assets/images/register.jpg',
        //height: 250,
      )
          // Text(
          //   'Enter Details!',
          //   style: TextStyle(
          //     color: mPrimaryTextColor,
          //     fontSize: 30,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          ),
    );
  }
}
