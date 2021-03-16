import 'package:flutter/material.dart';

class KulluMap extends StatelessWidget {
  const KulluMap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
          child: Image.asset(
        'assets/images/map_kullu.jpg',
        // height: 350,
      )),
    );
  }
}
