// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:gokullu/Database/database_helper.dart';
// import 'package:gokullu/screen/About/about_app.dart';
// // import 'package:signupexample/Database/database_helper.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:signupexample/main.dart';

// import '../constant.dart';
// import 'home.dart';

// class UserScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _UserScreen();
// }

// class _UserScreen extends State<UserScreen> with WidgetsBindingObserver {
//   final dbHelper = DatabaseHelper.instance;

//   Map<String, dynamic> _useData;
//   bool _fetchingData = true;
//   @override
//   void initState() {
//     _query();
//     super.initState();
//   }

//   Widget titleSection() {
//     return Container(
//       padding: const EdgeInsets.all(50),
//       child: Row(
//         children: [
//           Expanded(
//             /*1*/
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /*2*/
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: Text(
//                     _useData['address'],
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   _useData['contact1'],
//                   style: TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           /*3*/
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Icon(
//           //     Icons.account_circle,
//           //     color: _useData['gender'] == 'Male'
//           //         ? Colors.blue[700]
//           //         : Colors.red[700],
//           //     size: 28,
//           //   ),
//           // ),
//           // Text(_useData['age'].toString()),
//         ],
//       ),
//     );
//   }

//   Widget textSection() {
//     return Container(
//       padding: const EdgeInsets.only(left: 32, right: 32),
//       child: Text(
//         _useData['ephone1'],
//         softWrap: true,
//       ),
//     );
//   }

//   Widget _deleteUser() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: RaisedButton(
//         onPressed: () {
//           print('delete user');
//           _delete();
//         },
//         child: Text('Delete user'),
//       ),
//     );
//   }

//   Widget proceed() {
//     return Container(
//         padding: const EdgeInsets.all(16),
//         child: RaisedButton(
//           shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(35.0),
// //                    side: BorderSide(color: Colors.red)
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Proceed',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ],
//           ),
//           textColor: Colors.white,
//           color: mPrimaryTextColor,
//           padding: EdgeInsets.all(20),
//           onPressed: () {
//             print('Proceed');
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AboutApp()),
//             );
//           },
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         exit(0);
//         // return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: mBackgroundColor,
//           centerTitle: true,
//           elevation: 10,
//           title: Center(
//               child: Text(
//             'Welcome to Go Kullu',
//             style: TextStyle(
//               color: mPrimaryTextColor,
//             ),
//           )),
//           automaticallyImplyLeading: false,
//         ),
//         body: _fetchingData
//             ? CircularProgressIndicator()
//             : ListView(
//                 children: [
//                   // Image.file(
//                   //   File(_useData['image0']),
//                   //   height: 240,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   titleSection(),
//                   textSection(),
//                   proceed(),
//                   _deleteUser()
//                 ],
//               ),
//       ),
//     );
//   }

//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     print('query all rows:');

//     allRows.forEach((row) => print(row));
//     setState(() {
//       _useData = allRows[0];
//       _fetchingData = false;
//     });
//   }

//   void _delete() async {
//     // Assuming that the number of rows is the id for the last row.
//     final id = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(id);
//     print('deleted $rowsDeleted row(s): row $id');

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLogin', false);

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => MyHomePage()),
//     );
//   }
// }
