import 'package:flutter/material.dart';

class AboutUsHeader extends StatelessWidget {
  const AboutUsHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
          child: Image.asset(
        'assets/images/rath.jpg',
        // height: 350,
      )),
    );
  }
}
