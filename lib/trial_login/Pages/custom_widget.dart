import 'package:flutter/material.dart';

import '../../constant.dart';

class LogoImage extends StatelessWidget {
  final double imgHeight;
  LogoImage({this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/logo2_s.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText, this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              btnText,
              style: TextStyle(fontSize: 18, color: mBackgroundColor),
            ),
            SizedBox(height: 10),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color: mPrimaryTextColor,
    );
  }
}
