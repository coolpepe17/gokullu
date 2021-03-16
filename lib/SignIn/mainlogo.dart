import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget mainLogo() {
  return Expanded(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: new RawMaterialButton(
                onPressed: () {},
                child: SvgPicture.asset('assets/icons/logo2_s.svg'),
                // shape: new CircleBorder(),
                // elevation: 2.0,
                // fillColor: Colors.white,
                // padding: const EdgeInsets.all(15.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
