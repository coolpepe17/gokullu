import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key key,
    this.label,
    this.onChange,
    this.password = false,
    this.hint,
  }) : super(key: key);

  final String label;
  final String hint;
  final Function onChange;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      obscureText: password,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
        labelText: label,
        labelStyle: TextStyle(fontSize: 12, color: Colors.purple),

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
