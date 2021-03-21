import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';

class EContact1 extends StatefulWidget {
  @override
  _EContact1State createState() => new _EContact1State();
}

class _EContact1State extends State<EContact1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;

  setvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('econtact1fullname', _contact.fullName);
    prefs.setString('econtact1phoneno', _contact.phoneNumber.number);
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        // margin: const EdgeInsets.all(5.0),
        // padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  width: 360,
                  child: IconButton(
                    icon: Icon(Icons.person_add, size: 40),
                    // alignment: Alignment.topLeft,
                    color: Colors.grey[600],
                    onPressed: () async {
                      Contact contact = await _contactPicker.selectContact();
                      setState(() {
                        _contact = contact;
                        setvalue();
                      });
                    },
                  ),
                ),
                new Text(
                  _contact == null
                      ? 'No contact selected.'
                      : _contact.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
}
