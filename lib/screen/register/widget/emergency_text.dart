import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';

class EmergencyText extends StatelessWidget {
  const EmergencyText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Center(
        child: Text(
          'Emergency Contacts',
          style: TextStyle(
            color: mPrimaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
