import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
// import 'package:gokullu/constant.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // shape: StadiumBorder(),
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        primary: mPrimaryTextColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 5,
        shadowColor: Colors.black,
        onSurface: Colors.red,
      ),
      onPressed: press,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
