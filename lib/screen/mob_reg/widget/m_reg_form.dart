import 'package:flutter/material.dart';
import 'package:gokullu/screen/mob_reg/widget/input_text_field.dart';

class MobRegForm extends StatelessWidget {
  const MobRegForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: <Widget>[
              InputTextField(
                label: 'Mobile',
                hint: 'Enter your mobile no.',
                onChange: (value) {},
              ),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                label: 'Enter PIN',
                hint: 'Set a 4 digit PIN',
                onChange: (value) {},
              ),
              SizedBox(
                height: 8,
              ),
              InputTextField(
                label: 'Confirm PIN',
                hint: 'Confirm the 4 digit PIN',
                onChange: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
