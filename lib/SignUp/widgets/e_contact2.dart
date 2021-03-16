import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class EContact2 extends StatefulWidget {
  @override
  _EContact2State createState() => new _EContact2State();
}

class _EContact2State extends State<EContact2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact1;
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(8.0),
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
                    Contact contact1 = await _contactPicker.selectContact();
                    setState(() {
                      _contact1 = contact1;
                    });
                  },

                  // Text('Choose Emergency Contact 1'),
                  // decoration: InputDecoration(
                  //   border: InputBorder.none,
                  //   icon: Icon(Icons.person_add, size: 35),
                  // ),
                  // onPressed: () {
                  //   var contactNumber = openContactBook();
                  // },
                  // validator: (String value) {
                  //   if (!_formKey.currentState.validate()) {
                  //     return 'Enter Emergency Contact 1 Name';
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  // controller: widget.eContact1TextController,
                ),
              ),
              new Text(
                _contact1 == null
                    ? 'No contact selected.'
                    : _contact1.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              // Divider(),
            ],
          ),
        ),
      ),
    );
  }

  // void _passDataToParent(String key, dynamic value) {
  //   List<dynamic> addData = List<dynamic>();
  //   addData.add(key);
  //   addData.add(value);
  //   widget.parentAction(addData);
  // }

  @override
  bool get wantKeepAlive => true;
}
