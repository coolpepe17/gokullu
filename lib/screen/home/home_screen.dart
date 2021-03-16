import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/home/widget/continue_button.dart';
// import 'package:gokullu/screen/home/widget/login_and_register.dart';
import 'package:gokullu/screen/home/widget/slider_dot.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // color: Colors.blueAccent,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/trek3.jpg',
                  //height: 250,
                )),
          ),
          SliderDot(),
          SizedBox(
            height: 70,
          ),
          Text(
            'Welcome to Kullu!\n "The Valley of GODS" ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mPrimaryTextColor,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ContinueButton(),
          //RegisterScreen(),
          // LoginAndRegister(),
          //LoginWithFacebook()
        ],
      ),
    );
  }
}
