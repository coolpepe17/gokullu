import 'package:flutter/material.dart';
// import 'package:gokullu/constant.dart';

class WelcomeTo extends StatelessWidget {
  const WelcomeTo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/images/reg.png',
              height: 200,
            )),
      ),
    );
  }
}
