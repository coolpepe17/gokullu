import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/model/login_model.dart';
import 'package:gokullu/trial_login/model/login_model.dart';
import 'package:gokullu/widget/navbar.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  LoginRequestModel loginRequestModel;
  LoginModel loginModel = LoginModel();

  _setIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 10, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(13.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      // decoration: InputDecoration(
                      //     border: InputBorder.none,
                      //     icon: Icon(Icons.mail),
                      //     labelText: 'Email',
                      //     hintText: 'Type your email'),
                      // validator: (String value) {
                      //   if (value.trim().isEmpty) {
                      //     return 'Nickname is required';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => loginRequestModel.email = input,
                      // validator: (input) => !input.contains('@')
                      // ? "Email Id should be valid"
                      // : null,
                      decoration: new InputDecoration(
                        hintText: "Email Address",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      controller: _emailTextController,
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: 360,
                    child: TextFormField(
                      // obscureText: true,
                      // decoration: InputDecoration(
                      //     border: InputBorder.none,
                      //     icon: Icon(Icons.lock),
                      //     labelText: 'Password',
                      //     hintText: 'Type password'),
                      // validator: (String value) {
                      //   if (value.trim().isEmpty) {
                      //     return 'Nickname is required';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      style: TextStyle(color: Theme.of(context).accentColor),
                      keyboardType: TextInputType.text,
                      onSaved: (input) => loginRequestModel.password = input,
                      validator: (input) => input.length < 3
                          ? "Password should be more than 3 characters"
                          : null,
                      obscureText: hidePassword,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).accentColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      controller: _passwordTextController,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
//                    side: BorderSide(color: Colors.red)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign in',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      textColor: Colors.white,
                      color: mPrimaryColor,
                      padding: EdgeInsets.all(10),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await fetchData();
                        }
                        // if (_pageController.page.toInt() == 0) {
                        //print('Email: ${_emailTextController.text}');
                        //print('Password: ${_passwordTextController.text}');

                        //_setIsLogin();

                        // print('_userDataMap $_userDataMap');

                        // } else {
                        //   _pageController.animateToPage(
                        //       _pageController.page.toInt() + 1,
                        //       duration: Duration(milliseconds: 200),
                        //       curve: Curves.easeIn);
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Pankaj
  fetchData() async {
    try {
      String url = 'http://164.100.207.5/gokullu/Service1.svc/login?';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var bdata = jsonEncode({
        "trekkerEmail": "${_emailTextController.text}",
        "trekkerPassword": "${_passwordTextController.text}"
        // "trekkerEmail": "9418017999",
        // "trekkerPassword": "raj@12345"
      });

      Response resp = await http.post(url, headers: headers, body: bdata);
      if (resp.statusCode == 200) {
        var decoded = jsonDecode(resp.body);
        print(decoded);
        loginModel = loginModelFromJson(resp.body);
        if (loginModel.message.status == "200") {
          _setIsLogin();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyNavBar()),
          );
        } else {
          //
        }
      } else {
        //
      }
    } catch (e) {}
  }
}
