import 'package:flutter/material.dart';
import 'package:gokullu/SignIn/signin.dart';
import 'package:gokullu/userscreen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 6);
    // delayed 3 seconds to next page
    Future.delayed(d, () async {
      // to next page and close this page
      bool islogin = await _checklogginin();
      if (islogin) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyHomePage();
            },
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SignIn();
            },
          ),
          (route) => false,
        );
      }
    });

    super.initState();
  }

  Future<bool> _checklogginin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset('assets/images/gks.png'),
          // child: SvgPicture.asset('assets/icons/logo2_s.svg'),
        ),
      ),
    );
  }
}
