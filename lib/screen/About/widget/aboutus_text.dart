import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';

class AboutUsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Go Kullu App Version- 1.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Divider(thickness: 5),
            SizedBox(height: 25),
            Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            // SizedBox(
            //   // width: 360,
            //   child: Text(
            //     'email: hpkul[at]nic[dot]in',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: mPrimaryColor,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              // Text("Hi"),
              Icon(Icons.mail_outline, size: 30),

              Text(
                '  hpkul[at]nic[dot]in',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ]),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              // Text("Hi"),
              Icon(Icons.phone_callback, size: 30),
              Text(
                '  01902224130',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ]),
            // SizedBox(
            //   width: 360,
            //   child: Text(
            //     'Phone: 01902224130',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: mPrimaryColor,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ]),
    );
  }
}
