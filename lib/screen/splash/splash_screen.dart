import 'package:flutter/material.dart';
import 'package:gokullu/userscreen/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 6);
    // delayed 3 seconds to next page
    Future.delayed(d, () {
      // to next page and close this page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MyHomePage();
          },
        ),
        (route) => false,
      );
    });

    super.initState();
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

// import 'package:flutter/material.dart';
// import 'package:gokullu/SignIn/signin.dart';
// import 'package:gokullu/userscreen/home.dart';
// import 'package:gokullu/widget/navbar.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   bool islogin = false;
//   @override
//   void initState() {
//     var d = Duration(seconds: 6);
//     // delayed 6 seconds to next page
//     Future.delayed(d, () async {
//       // to next page and close this page
//       await _checklogginin();
//       if (islogin) {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return MyNavBar();
//             },
//           ),
//           (route) => false,
//         );
//       } else {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return MyHomePage();
//             },
//           ),
//           (route) => false,
//         );
//       }
//     });

//     super.initState();
//   }

//   _checklogginin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     islogin = prefs.get('isLogin') ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Image.asset('assets/images/gks.png'),
//           // child: SvgPicture.asset('assets/icons/logo2_s.svg'),
//         ),
//       ),
//     );
//   }
// }
