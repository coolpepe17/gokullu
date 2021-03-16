import 'package:flutter/material.dart';
import 'package:gokullu/screen/register/widget/input_field.dart';

class RegForm extends StatelessWidget {
  const RegForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: <Widget>[
              InputTextField(
                label: 'Name',
                hint: 'Enter Name',
                onChange: (value) {},
              ),
              SizedBox(
                height: 5,
              ),
              InputTextField(
                label: 'Fathers Name',
                hint: 'Enter Fathers Name',
                onChange: (value) {},
              ),
              SizedBox(
                height: 5,
              ),
              InputTextField(
                label: 'Address',
                hint: 'Enter Address',
                onChange: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmergencyForm extends StatelessWidget {
  const EmergencyForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 15,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: <Widget>[
              InputTextField(
                label: 'Emergency Contact 1:',
                hint: 'Enter Name',
                onChange: (value) {},
              ),
              SizedBox(
                height: 5,
              ),
              InputTextField(
                label: 'Phone No.',
                hint: 'Enter Mobile/Landline',
                onChange: (value) {},
              ),
              SizedBox(
                height: 5,
              ),
              InputTextField(
                label: 'Emergency Contact 2',
                hint: 'Enter Name',
                onChange: (value) {},
              ),
              SizedBox(
                height: 5,
              ),
              InputTextField(
                label: 'Phone No.',
                hint: 'Enter Mobile/Landline',
                onChange: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
