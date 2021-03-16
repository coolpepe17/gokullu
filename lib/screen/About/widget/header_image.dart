import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
          child: Image.asset(
        'assets/images/trek_s.jpg',
        // height: 350,
      )),
    );
  }
}
