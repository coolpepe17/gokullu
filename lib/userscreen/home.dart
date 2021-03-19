import 'package:flutter/material.dart';
import 'package:gokullu/SignIn/mainlogo.dart';
import 'package:gokullu/SignIn/signin.dart';
import 'package:gokullu/SignIn/signup.dart';
import 'package:gokullu/SignUp/reg.dart';
import 'package:gokullu/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLogin = false;
  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = (prefs.get('isLogin') ?? false);

    // setState(() {
    //   _isLogin = isLogin;
    // });

    print('prefs $isLogin');
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLogin ? _signInWidget() : MyNavBar();
  }

  Widget _signInWidget() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                // NetworkImage(
                //     'https://cdn.pixabay.com/photo/2020/03/19/04/58/coconut-trees-4946270_1280.jpg'),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[mainLogo(), SignIn(), SignUp()],
          ),
        ),
      ),
    );
  }
}
