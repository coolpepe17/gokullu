import 'package:flutter/material.dart';

class EmergencyForm extends StatefulWidget {
  EmergencyForm(
      this.addressTextController,
      this.eContact1TextController,
      this.ePhone1TextController,
      this.eContact2TextController,
      this.ePhone2TextController,
      this.parentAction);

  final TextEditingController addressTextController;
  final TextEditingController eContact1TextController;
  final TextEditingController ePhone1TextController;
  final TextEditingController eContact2TextController;
  final TextEditingController ePhone2TextController;

  final ValueChanged<List<dynamic>> parentAction;

  @override
  State<StatefulWidget> createState() => _SignUpForm();
}

enum GenderEnum { male, female }

class _SignUpForm extends State<EmergencyForm>
    with AutomaticKeepAliveClientMixin<EmergencyForm> {
  // GenderEnum _userGender = GenderEnum.male;
  // String _selectDateString = 'Select your birthday';

  // bool _agreedToTerm = false;
  // DateTime _selectedDate = DateTime.now();

  // Future<Null> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: _selectedDate,
  //       firstDate: DateTime(1930, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != _selectedDate)
  //     setState(() {
  //       _selectedDate = picked;
  //       _selectDateString = "${_selectedDate.toLocal()}".split(' ')[0];
  //       _passDataToParent('age', calculateAge(picked));
  //     });
  //   print('your age is ${calculateAge(picked)}');
  // }

  // calculateAge(DateTime birthDate) {
  //   DateTime currentDate = DateTime.now();
  //   int age = currentDate.year - birthDate.year;
  //   int month1 = currentDate.month;
  //   int month2 = birthDate.month;
  //   if (month2 > month1) {
  //     age--;
  //   } else if (month1 == month2) {
  //     int day1 = currentDate.day;
  //     int day2 = birthDate.day;
  //     if (day2 > day1) {
  //       age--;
  //     }
  //   }
  //   return age;
  // }

  // void _setAgreedToTerm(bool newValue) {
  //   _passDataToParent('term', newValue);
  //   setState(() {
  //     _agreedToTerm = newValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.home_rounded),
                  labelText: 'Address',
                  hintText: 'Enter yoour Address'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Address is required';
                } else {
                  return null;
                }
              },
              controller: widget.addressTextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: TextFormField(
              // obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.account_box),
                  labelText: 'Emergency Contact 1 Name',
                  hintText: 'Enter Emergency Contact Name'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Enter Emergency Contact Name required';
                } else {
                  return null;
                }
              },
              controller: widget.eContact1TextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.mobile_friendly),
                  labelText: 'Phone / Mobile No',
                  hintText: 'Enter Emergency Contact No.'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Enter Emergency Contact Phone required';
                } else {
                  return null;
                }
              },
              controller: widget.ePhone1TextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.account_box),
                  labelText: 'Emergency Contact 2 Name',
                  hintText: 'Enter Emergency Contact Name'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Enter Emergency Contact Name required';
                } else {
                  return null;
                }
              },
              controller: widget.eContact2TextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.mobile_friendly),
                  labelText: 'Phone / Mobile No',
                  hintText: 'Enter Emergency Contact No.'),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'Enter Emergency Contact Phone required';
                } else {
                  return null;
                }
              },
              controller: widget.ePhone2TextController,
            ),
          ),
          Divider(),
        ],
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
