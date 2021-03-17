import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gokullu/SignUp/widgets/e_contact1.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/model/login_model.dart';
import 'package:gokullu/trial_login/model/login_model.dart';
import 'package:gokullu/widget/navbar.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegForm();
}

class _RegForm extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 70, 10, 10),
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
                    'Sign Up',
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
                      // Email Field
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => loginRequestModel.email = input,
                          validator: (input) => input.length < 1
                              // validator: (input) =>!input.contains('@')
                              ? 'Email Required'
                              : null,
                          decoration: new InputDecoration(
                            hintText: 'Enter Email',
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

                      // Password Field
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              loginRequestModel.password = input,
                          validator: (input) => input.length < 1
                              ? 'Password cannot be empty'
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: 'Enter Password',
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
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          controller: _passwordTextController,
                        ),
                      ),
                      Divider(),

                      // Confirm Password Field
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              loginRequestModel.confirmPassword = input,
                          validator: (input) => input.length < 1
                              ? 'Confirm Password cannot be empty'
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: 'Confirm Password',
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
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          controller: _confirmPasswordTextController,
                        ),
                      ),
                      Divider(),

                      // Name Field
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel.name = input,
                          validator: (input) =>
                              input.length < 1 ? 'Name cannot be empty' : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: 'Enter Your Name',
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
                          controller: _confirmPasswordTextController,
                        ),
                      ),
                      Divider(),

                      // Mobile Field
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel.mobile = input,
                          validator: (input) => input.length < 1
                              ? 'Mobile can not be empty'
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: 'Enter Mobile No.',
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
                          controller: _confirmPasswordTextController,
                        ),
                      ),
                      Divider(),

                      // Address Field
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => loginRequestModel.address = input,
                          validator: (input) => input.length < 1
                              ? 'Address Field can not be empty'
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: 'Enter Your Address',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.home_filled,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          controller: _confirmPasswordTextController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Row(children: <Widget>[EContact1]),
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
                                'Submit Sign Up',
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
                          }),
                    ),
                  ),
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
    try {
      String url = 'http://164.100.207.5/gokullu/Service1.svc/login?';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var bdata = jsonEncode({
        'trekkerEmail': '${_emailTextController.text}',
        'trekkerPassword': '${_passwordTextController.text}'
      });

      Response resp = await http.post(url, headers: headers, body: bdata);
      if (resp.statusCode == 200) {
        var decoded = jsonDecode(resp.body);
        print(decoded);
        loginModel = loginModelFromJson(resp.body);
        if (loginModel.message.status == '200') {
          _setIsLogin();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyNavBar()),
          );
        } else
        // (loginModel.message.status == '400');
        {
          print('Invalid Login');
          //
        }
      } else {
        //
      }
    } catch (e) {}
  }
}
