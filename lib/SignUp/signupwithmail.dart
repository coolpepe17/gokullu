import 'package:flutter/material.dart';
import 'package:gokullu/Database/database_helper.dart';
import 'package:gokullu/SignUp/widgets/e_contact1.dart';
import 'package:gokullu/SignUp/signupform.dart';
import 'package:gokullu/SignUp/widgets/e_contact2.dart';
import 'package:gokullu/userscreen/home.dart';
// import 'package:gokullu/widget/navbar.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// import '../constant.dart';
// import '../signin.dart';

Future<Album> fetchAlbum() async {
  final response =
      // await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
      await http.put(Uri.https(
          '10.146.105.4/gokullu/service1.svc/RegisterUser?', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class SignUpWithMail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpWithMail();
}

class _SignUpWithMail extends State<SignUpWithMail> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _mobileTextController = TextEditingController();
  final _addressTextController = TextEditingController();

  Map<String, dynamic> _userDataMap = Map<String, dynamic>();
  String contact1name;
  String contact1phoneno;
  String contact2name;
  String contact2phoneno;

  // PageController _pageController = PageController();

  String _nextText = 'Submit';
  Color _nextColor = mPrimaryColor;

  _updateMyTitle(List<dynamic> data) {
    setState(() {
      _userDataMap[data[0]] = data[1];
    });
  }

  _setIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
  }

  _setcontact1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    contact1name = prefs.getString('econtact1fullname');
    contact1phoneno = prefs.getString('econtact1phoneno');
  }

  _setcontact2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    contact2name = prefs.getString('econtact2fullname');
    contact2phoneno = prefs.getString('econtact2phoneno');
  }

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: NetworkImage(
            //             'https://cdn.pixabay.com/photo/2020/03/19/04/58/coconut-trees-4946270_1280.jpg'),
            //         fit: BoxFit.fill)),
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50.0, right: 15, left: 15),
                padding: const EdgeInsets.only(top: 10, bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 380,
                        child: SignUpForm(
                            _emailTextController,
                            _passwordTextController,
                            _confirmPasswordTextController,
                            _nameTextController,
                            _mobileTextController,
                            _addressTextController,
                            _updateMyTitle),
                      ),
                      SizedBox(
                          child: Text(
                        'Select 2 Emergency Contacts',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                      // Call for Emergency contacts
                      EContact1(),
                      EContact2(),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                textColor: Colors.black,
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                onPressed: () {
                                  Navigator.pop(context);
//                              _query();
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        _nextText,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  textColor: Colors.white,
                                  color: _nextColor,
                                  padding: EdgeInsets.all(10),
                                  onPressed: () async {
                                    {
                                      final snackBar = SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        duration: Duration(seconds: 10),
                                        elevation: 10.0,
                                        backgroundColor: mPrimaryTextColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          // side: BorderSide(
                                          //   color: Colors.green,
                                          //   width: 2,
                                          // ),
                                        ),
                                        content: Text(
                                            'Registration Successful!',
                                            style: TextStyle(fontSize: 18)),
                                        action: SnackBarAction(
                                          textColor: Colors.white,
                                          label: 'Proceed to Login',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );

                                      // Find the ScaffoldMessenger in the widget tree
                                      // and use it to show a SnackBar.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }

                                    if (_formKey.currentState.validate()) {
                                      await fetchData();
                                      // fetchData();
                                      _setIsLogin();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
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
            ],
          ),
        )),
      ),
    );
  }

  // void _query() async {
  //   final allRows = await dbHelper.queryAllRows();
  //   print('query all rows:');
  //   allRows.forEach((row) {
  //     print(row);

  //     return null;
  //   });
  // }

//Pankaj
  fetchData() async {
    await _setcontact1();
    await _setcontact2();
    try {
      String url = 'http://164.100.207.5/gokullu/Service1.svc/RegisterUser?';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var bdata = jsonEncode({
        "trekkerEmail": "${_emailTextController.text}",
        "trekkerPassword": "${_passwordTextController.text}",
        "trekkerName": "${_nameTextController.text}",
        "trekkerMobile": "${_mobileTextController.text}",
        "trekkerGender": " ",
        "trekkerAddress": "${_addressTextController.text}",
        "emergencyContact1": contact1phoneno,
        "emergencyName1": contact1name,
        "emergencyContact2": contact2phoneno,
        "emergencyName2": contact2name,
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
