import 'package:flutter/material.dart';

class DevNic extends StatelessWidget {
  const DevNic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
          child: Image.asset(
        'assets/images/dev_nic.png',
        height: 40,
      )),
    );
  }
}
