import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';

class InputFields extends StatelessWidget {
  // const InputFields({
  //   Key key,
  //   this.label,
  //   this.onChange,
  //   this.password = false,
  //   this.hint,
  //   this.number,
  //   this.pin,
  // }) : super(key: key);

  // final String label;
  // final String hint;
  // final Function onChange;
  // final bool password;
  // final int number;
  // final int pin;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: onChange,
      // obscureText: password,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        // hintText: hint,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        // labelText: label,
        labelStyle: TextStyle(fontSize: 14, color: Colors.purple),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: mSecondColor,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: mPrimaryColor,
              width: 2,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            )),
      ),
    );
  }
}
