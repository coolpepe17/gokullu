import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';

class EmergencyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Kindly Enter 2 Contacts with their Phone/Mobile No. who can be contacted in case of any Emergency',
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
