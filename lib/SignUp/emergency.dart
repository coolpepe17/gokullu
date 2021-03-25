import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gokullu/Database/database_helper.dart';
import 'package:gokullu/SignUp/widgets/e_text.dart';
// import 'package:gokullu/SignUp/widgets/e_contact1.dart';
// import 'package:gokullu/SignUp/widgets/e_contact2.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/model/login_model.dart';
import 'package:gokullu/screen/About/about_app.dart';
import 'package:gokullu/trial_login/model/login_model.dart';
// import 'package:gokullu/userscreen/home.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EContacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EContacts();
}

class _EContacts extends State<EContacts> {
  final _eContact1NameTextController = TextEditingController();
  final _eContact2NameTextController = TextEditingController();
  final _eContact1TextController = TextEditingController();
  final _eContact2TextController = TextEditingController();

  // Map<String, dynamic> _userDataMap = Map<String, dynamic>();
  String contact1name;
  String contact1phoneno;
  String contact2name;
  String contact2phoneno;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  LoginRequestModel loginRequestModel;
  LoginModel loginModel = LoginModel();

  // _setIsLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isLogin', true);
  // }

  // _setcontact1() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   contact1name = prefs.getString('econtact1fullname');
  //   contact1phoneno = prefs.getString('econtact1phoneno');
  // }

  // _setcontact2() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   contact2name = prefs.getString('econtact2fullname');
  //   contact2phoneno = prefs.getString('econtact2phoneno');
  // }

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _eContact1NameTextController.dispose();
    _eContact1TextController.dispose();
    _eContact2NameTextController.dispose();
    _eContact2TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 60, 10, 10),
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[400], width: 3),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            children: <Widget>[
              EmergencyText(),
              Divider(
                height: 0,
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Emergency Contacts Form',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // Emergency Contact1 Name Field
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (input) => loginRequestModel.name = input,
                            validator: (input) => input.length < 1
                                ? 'Name cannot be empty'
                                : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: 'Enter Emergency Contact 1 Name',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            controller: _eContact1NameTextController,
                          ),
                        ),
                        Divider(),

                        // E Contact 1 Phone/Mobile
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            onSaved: (input) =>
                                loginRequestModel.mobile = input,
                            validator: (input) => input.length < 10
                                ? 'Phone/Mobile can not be empty'
                                : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: 'Enter Phone/Mobile No.',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.mobile_friendly,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            controller: _eContact1TextController,
                          ),
                        ),
                        Divider(),

                        // Emergency Contact2 Name Field
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                loginRequestModel.address = input,
                            validator: (input) => input.length < 1
                                ? 'Name cannot be empty'
                                : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: 'Enter Emergency Contact 2 Name',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.person_add_alt_1_rounded,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            controller: _eContact2NameTextController,
                          ),
                        ),

                        Divider(),

                        // E Contact 2 Phone/Mobile
                        SizedBox(
                          width: 360,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                loginRequestModel.address = input,
                            validator: (input) => input.length < 1
                                ? 'Phone/Mobile can not be empty'
                                : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: 'Enter Phone/Mobile No.',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.mobile_friendly,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            controller: _eContact2TextController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Center(
                          child: ElevatedButton(
                              child: Text(
                                'Submit Emergency Contacts ',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                primary: mPrimaryTextColor,
                                onPrimary: Colors.white,
                                padding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  final snackBar = SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 5),
                                    elevation: 10.0,
                                    backgroundColor: mPrimaryTextColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      // side: BorderSide(
                                      //   color: Colors.green,
                                      //   width: 2,
                                      // ),
                                    ),
                                    content: Text('Emergency Contacts Saved!',
                                        style: TextStyle(fontSize: 15)),
                                    action: SnackBarAction(
                                      textColor: Colors.white,
                                      label: '',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );

                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  await fetchData();
                                  // fetchData();
                                  // _setIsLogin();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutApp()),
                                  );
                                }
                                {}

                                // if (_formKey.currentState.validate()) {
                                //   await fetchData();
                                //   // fetchData();
                                //   _setIsLogin();
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => MyHomePage()),
                                //   );
                                // }
                              }),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   tooltip: 'Back',
                  //   child: Icon(Icons.arrow_back_rounded),
                  // ),
                  Transform.scale(
                    scale: 1.15,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EContacts()),
                        );
                      },
                      icon: Icon(Icons.terrain_rounded, size: 35),
                      label: Text(
                        'Start Tracking',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Pankaj
  fetchData() async {
    // await _setcontact1();
    // await _setcontact2();
    try {
      String url = 'http://164.100.207.5/gokullu/Service1.svc/RegisterUser?';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var bdata = jsonEncode({
        // "trekkerEmail": "${_emailTextController.text}",
        // "trekkerPassword": "${_passwordTextController.text}",
        // "trekkerConfirmPassword": "${_confirmPasswordTextController.text}",
        // "trekkerName": "${_nameTextController.text}",
        // "trekkerMobile": "${_mobileTextController.text}",
        // "trekkerGender": " ",
        // "trekkerAddress": "${_addressTextController.text}",
        "emergencyContact1": '${_eContact1NameTextController.text}',
        "emergencyName1": '${_eContact1TextController.text}',
        "emergencyContact2": '${_eContact2NameTextController.text}',
        "emergencyName2": '${_eContact2TextController.text}',
        // "emergencyContact1": contact1phoneno,
        // "emergencyName1": contact1name,
        // "emergencyContact2": contact2phoneno,
        // "emergencyName2": contact2name,
        "loggedIn": "N",
        "idDeleted": "N"
      });

      Response resp = await http.post(url, headers: headers, body: bdata);
      if (resp.statusCode == 200) {
        print('saved');
        // var decoded = jsonDecode(resp.body);
        // print(decoded);
        // loginModel = loginModelFromJson(resp.body);
        //   if (loginModel.message.status == "200") {
        //     _setIsLogin();
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => MyNavBar()),
        //     );
        //   } else {
        //     // error - Invalid user
        //     // alert ('Invalid user, try again');

        //   }
        // } else {
        //   // Error - Server connection not established
        //   // alert
      }
    } catch (e) {}
  }
}
