// import 'package:flutter/material.dart';
// import 'package:native_contact_picker/native_contact_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../constant.dart';

// class EContact2 extends StatefulWidget {
//   @override
//   _EContact2State createState() => new _EContact2State();
// }

// class _EContact2State extends State<EContact2> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final NativeContactPicker _contactPicker = new NativeContactPicker();
//   Contact _contact1;

//   setvalue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('econtact2fullname', _contact1.fullName);
//     prefs.setString('econtact2phoneno', _contact1.phoneNumber);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // super.build(context);
//     return Container(
//       // margin: const EdgeInsets.all(10.0),
//       // padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[400]),
//         borderRadius: BorderRadius.all(Radius.circular(25.0)),
//       ),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 50,
//                 width: 360,
//                 child: IconButton(
//                   icon: Icon(Icons.person_add, size: 40),
//                   // alignment: Alignment.topLeft,
//                   color: Colors.grey[600],
//                   onPressed: () async {
//                     Contact contact1 = await _contactPicker.selectContact();
//                     setState(() {
//                       _contact1 = contact1;
//                       setvalue();
//                     });
//                   },
//                 ),
//               ),
//               new Text(
//                 _contact1 == null
//                     ? 'No contact selected.'
//                     : _contact1.toString(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: mPrimaryColor,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool get wantKeepAlive => true;
// }
