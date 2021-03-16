import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/trek_menu/trek_menu.dart';
import 'package:gokullu/widget/round_button.dart';
import 'widget/emergency_text.dart';
import 'widget/register_form.dart';

class RegScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // WelcomeTo(),
            RegForm(),
            EmergencyText(),
            EmergencyForm(),
            // SubmitButton(),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Button(
                    title: 'Submit Details',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TrekMenu();
                          },
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      title: Text(
        'Emergency Contacts Details',
        style: TextStyle(
          color: mPrimaryTextColor,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: mPrimaryTextColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
