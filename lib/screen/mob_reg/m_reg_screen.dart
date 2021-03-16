import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/about/about_app.dart';
import 'package:gokullu/screen/mob_reg/widget/form.dart';
import 'package:gokullu/screen/mob_reg/widget/m_reg_form.dart';
import 'package:gokullu/screen/mob_reg/widget/m_reg_image.dart';
import 'package:gokullu/widget/round_button.dart';

class MobRegScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              MobRegImg(),
              MobRegForm(),
              MyForm(),
              SizedBox(
                height: 30,
              ),
              // Button(),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Button(
                      title: 'Submit & Proceed',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AboutApp();
                            },
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
            ])));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: mBackgroundColor,
      elevation: 5,
      centerTitle: true,
      title: Text(
        'Register your Mobile',
        style: TextStyle(
          color: mPrimaryTextColor,
        ),
      ),
    );
  }
}
