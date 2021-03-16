import 'package:flutter/material.dart';
import 'dart:ui';
// import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/about/about_app.dart';
import 'package:gokullu/widget/round_button.dart';
// import 'package:gokullu/screen/about/about_app.dart';
// import 'package:gokullu/screen/mob_reg/widget/m_reg_form.dart';
// import 'package:gokullu/screen/mob_reg/widget/m_reg_image.dart';
// import 'package:gokullu/widget/round_button.dart';

import '../../../constant.dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyForm(),
//     );
//   }
// }

class MyForm extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        // body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              SizedBox(height: 150),
              TextFormField(
                keyboardType: TextInputType.phone,
                // style: TextStyle(color: mPrimaryColor),
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 14, color: Colors.purple),
                  labelText: "Enter Your Mobile Number",
                  icon: Icon(
                    Icons.phone_android,
                    color: Colors.purple,
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: mPrimaryColor,
                    ),
                  ),
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
                  //fillColor: Colors.green
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Username can not be empty";
                  } else if (value.length < 10) {
                    return "Enter a Valid Mobile Number";
                  } else if (value.length > 10) {
                    return "Enter a Valid Mobile Number";
                  } else
                    return null;
                },

                // style: new TextStyle(
                // fontFamily: "Poppins",
                // keyboardType: TextInputType.number,
                // textInputAction: TextInputAction.done,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return "Username can not be empty";
                //   } else if (value.length < 10) {
                //     return "Enter a Valid Mobile Number";
                //   } else if (value.length > 10) {
                //     return "Enter a Valid Mobile Number";
                //   } else
                //     return null;
                // },
                // decoration: InputDecoration(
                //     hintText: 'Enter Mobile Number',
                //     // labelText: _weightMessage,
                //     icon: Icon(Icons.phone_android),
                //     fillColor: Colors.white),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value.isEmpty) {
                    return "PIN can not be empty";
                  } else if (value.length < 4) {
                    return "Enter a Valid 4 Digit Pin";
                  } else if (value.length > 4) {
                    return "Enter a Valid 4 Digit Pin";
                  } else
                    return null;
                },
                decoration: InputDecoration(
                    hintText: 'Enter 4 digit PIN',
                    // labelText: _weightMessage,
                    icon: Icon(Icons.fiber_pin_rounded),
                    fillColor: Colors.white),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value.isEmpty) {
                    return "PIN can not be empty";
                  } else if (value.length < 4) {
                    return "Enter a Valid 4 Digit Pin";
                  } else if (value.length > 4) {
                    return "Enter a Valid 4 Digit Pin";
                  } else
                    return null;
                },
                decoration: InputDecoration(
                    hintText: 'Confirm the 4 digit PIN',
                    // labelText: _weightMessage,
                    icon: Icon(Icons.fiber_pin_rounded),
                    fillColor: Colors.white),
              ),
              // Button(),
              SizedBox(height: 50),
              // FlatButton(
              //   child: Text("Submit"),
              //   color: Colors.purple,
              //   textColor: Colors.white,
              //   onPressed: () {
              //     if (_key.currentState.validate()) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(content: Text('Data Submitted')));
              //       // print("Your data is submitted");
              //     }
              //   },
              // ),
              SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Button(
                      title: 'Submit',
                      press: () {
                        if (_key.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Data Submitted')));
                          // print("Your data is submitted");
                        }
                      },
                    )),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Button(
                      title: 'Proceed',
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
            ],
          ),
        ),
      ),
    );
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
