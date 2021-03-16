import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:gokullu/constant.dart';

// void main() {
//   runApp(new MyContact());
// }

class MyContact extends StatefulWidget {
  @override
  _MyContactState createState() => new _MyContactState();
}

class _MyContactState extends State<MyContact> {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // home: new Scaffold(
      // appBar: new AppBar(
      // title: new Text('Plugin example app'),
      // ),
      home: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new MaterialButton(
              color: Colors.blue,
              child: new Text("CLICK ME"),
              onPressed: () async {
                Contact contact = await _contactPicker.selectContact();
                setState(() {
                  _contact = contact;
                });
              },
            ),
            new Text(
              _contact == null ? 'No contact selected.' : _contact.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: mPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
