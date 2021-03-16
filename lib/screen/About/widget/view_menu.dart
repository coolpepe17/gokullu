import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
// import 'package:gokullu/screen/about/about_app.dart';
import 'package:gokullu/screen/trek_menu/trek_menu.dart';

class ViewTrekButton extends StatelessWidget {
  const ViewTrekButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
          primary: mPrimaryTextColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(36))),
          elevation: 8,
          shadowColor: Colors.black,
          onSurface: Colors.red,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TrekMenu();
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            'View Treks',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:gokullu/screen/trek_menu/trek_menu.dart';
// import 'package:gokullu/widget/round_button.dart';

// class ViewMenu extends StatelessWidget {
//   const ViewMenu({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 12,
//         vertical: 20,
//       ),
//       child: RoundButton(
//         title: 'View Treks1',
//         press: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return TrekMenu();
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
