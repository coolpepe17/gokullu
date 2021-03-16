import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import '../constant.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm(
      this.emailTextController,
      this.passwordTextController,
      this.confirmPasswordTextController,
      this.nameTextController,
      this.mobileTextController,
      this.addressTextController,
      this.eContact1TextController,
      // this.ePhone1TextController,
      this.eContact2TextController,
      // this.ePhone2TextController,
      this.parentAction);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController confirmPasswordTextController;
  final TextEditingController nameTextController;
  final TextEditingController mobileTextController;
  final TextEditingController addressTextController;
  final TextEditingController eContact1TextController;
  // final TextEditingController ePhone1TextController;
  final TextEditingController eContact2TextController;
  // final TextEditingController ePhone2TextController;

  final ValueChanged<List<dynamic>> parentAction;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<StatefulWidget> createState() => _SignUpForm();
}

enum GenderEnum { male, female }

class _SignUpForm extends State<SignUpForm>
    with AutomaticKeepAliveClientMixin<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Future<String> openContactBook() async {
  //   Contact contact = await ContactPicker().selectContact();
  //   if (contact != null) {
  //     var phoneNumber = contact.phoneNumber.number
  //         .toString()
  //         .replaceAll(new RegExp(r'\s+'), '');
  //     return phoneNumber;
  //   }
  //   return '';
  // }

  // final ContactPicker _contactPicker = new ContactPicker();
  // Contact _contact;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                width: 360,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.mail),
                      // labelText: 'Email',
                      hintText: 'Type your email'),
                  validator: (value) {
                    if (!_formKey.currentState.validate()) {
                      return 'Nickname is required';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.emailTextController,
                ),
              ),
              Divider(),
              SizedBox(
                height: 40,
                width: 360,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.lock),
                      // labelText: 'Password',
                      hintText: 'Type password'),
                  validator: (value) {
                    if (!_formKey.currentState.validate()) {
                      return 'Password is required';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.passwordTextController,
                ),
              ),
              Divider(),
              SizedBox(
                height: 40,
                width: 360,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.lock),
                      // labelText: 'Confirm Password',
                      hintText: 'Re-Type password'),
                  validator: (value) {
                    if (!_formKey.currentState.validate()) {
                      return 'Password is required';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.confirmPasswordTextController,
                ),
              ),
              Divider(),
              SizedBox(
                height: 40,
                width: 360,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.account_circle),
                      // labelText: 'Name',
                      hintText: 'Type Name'),
                  validator: (value) {
                    if (!_formKey.currentState.validate()) {
                      return 'Nickname is required';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.nameTextController,
                ),
              ),
              Divider(),
              SizedBox(
                height: 40,
                width: 360,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.mobile_friendly),
                      // labelText: 'Mobile No.',
                      hintText: 'Enter Your Mobile'),
                  validator: (String value) {
                    if (!_formKey.currentState.validate()) {
                      return 'Mobile is required';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.mobileTextController,
                ),
              ),
              Divider(),
              SizedBox(
                height: 40,
                width: 360,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.home_filled),
                      // labelText: 'Address.',
                      hintText: 'Enter Your Address'),
                  validator: (String value) {
                    if (!_formKey.currentState.validate()) {
                      return 'Address is required';
                    } else {
                      return null;
                    }
                  },
                  controller: widget.addressTextController,
                ),
              ),
              // Divider(),
              // SizedBox(
              //   height: 60,
              //   width: 360,
              //   child: IconButton(
              //     icon: Icon(Icons.person_add, size: 40),
              //     // alignment: Alignment.topLeft,
              //     color: Colors.grey[600],
              //     onPressed: () async {
              //       Contact contact = await _contactPicker.selectContact();
              //       setState(() {
              //         _contact = contact;
              //       });
              //     },

              //     // Text('Choose Emergency Contact 1'),
              //     // decoration: InputDecoration(
              //     //   border: InputBorder.none,
              //     //   icon: Icon(Icons.person_add, size: 35),
              //     // ),
              //     // onPressed: () {
              //     //   var contactNumber = openContactBook();
              //     // },
              //     // validator: (String value) {
              //     //   if (!_formKey.currentState.validate()) {
              //     //     return 'Enter Emergency Contact 1 Name';
              //     //   } else {
              //     //     return null;
              //     //   }
              //     // },
              //     // controller: widget.eContact1TextController,
              //   ),
              // ),
              // new Text(
              //   _contact == null ? 'No contact selected.' : _contact.toString(),
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       color: mPrimaryColor,
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold),
              // ),
              // Divider(),
              // SizedBox(
              //   height: 60,
              //   width: 360,
              //   child: IconButton(
              //     icon: Icon(Icons.person_add, size: 40),
              //     // alignment: Alignment.topLeft,
              //     color: Colors.grey[600],
              //     onPressed: () async {
              //       Contact contact = await _contactPicker.selectContact();
              //       setState(() {
              //         _contact = contact;
              //       });
              //     },

              //     // Text('Choose Emergency Contact 1'),
              //     // decoration: InputDecoration(
              //     //   border: InputBorder.none,
              //     //   icon: Icon(Icons.person_add, size: 35),
              //     // ),
              //     // onPressed: () {
              //     //   var contactNumber = openContactBook();
              //     // },
              //     // validator: (String value) {
              //     //   if (!_formKey.currentState.validate()) {
              //     //     return 'Enter Emergency Contact 1 Name';
              //     //   } else {
              //     //     return null;
              //     //   }
              //     // },
              //     // controller: widget.eContact1TextController,
              //   ),
              // ),
              // new Text(
              //   _contact == null ? 'No contact selected.' : _contact.toString(),
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       color: mPrimaryColor,
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold),
              // ),
              // // SizedBox(
              // //   width: 360,
              // //   child: TextFormField(
              // //     keyboardType: TextInputType.number,
              // //     decoration: InputDecoration(
              // //         border: InputBorder.none,
              // //         icon: Icon(Icons.mobile_screen_share),
              // //         labelText: 'Mobile / Phone No.',
              // //         hintText: 'Enter Emergency Contact 1 Mobile or Phone '),
              // //     validator: (String value) {
              // //       if (!_formKey.currentState.validate()) {
              // //         return 'Mobile/Phone is required';
              // //       } else {
              // //         return null;
              // //       }
              // //     },
              // //     controller: widget.ePhone1TextController,
              // //   ),
              // // ),
              // // Divider(),
              // // SizedBox(
              // //   width: 360,
              // //   child: TextFormField(
              // //     decoration: InputDecoration(
              // //       border: InputBorder.none,
              // //       icon: Icon(Icons.person_add, size: 35),
              // //       // labelText: 'Emergency Contact 2',
              // //       // hintText: 'Emergency Contact 2 Name'
              // //     ),
              // //     validator: (String value) {
              // //       if (!_formKey.currentState.validate()) {
              // //         return 'Enter Emergency Contact 2 Name';
              // //       } else {
              // //         return null;
              // //       }
              // //     },
              // //     controller: widget.eContact2TextController,
              // //   ),
              // // ),
              // // Divider(),
              // // SizedBox(
              // //   width: 360,
              // //   child: TextFormField(
              // //     keyboardType: TextInputType.number,
              // //     decoration: InputDecoration(
              // //         border: InputBorder.none,
              // //         icon: Icon(Icons.mobile_screen_share),
              // //         labelText: 'Mobile / Phone No.',
              // //         hintText: 'Enter Emergency Contact 2 Mobile or Phone '),
              // //     validator: (String value) {
              // //       if (!_formKey.currentState.validate()) {
              // //         return 'Mobile/Phone is required';
              // //       } else {
              // //         return null;
              // //       }
              // //     },
              // //     controller: widget.ePhone2TextController,
              // //   ),
              // // ),
              // Divider(),
              // // Row(
              // //   children: <Widget>[
              // //     Icon(
              // //       Icons.wc,
              // //       color: Colors.grey,
              // //     ),
              // //     Radio(
              // //       value: GenderEnum.male,
              // //       groupValue: _userGender,
              // //       onChanged: (GenderEnum value) {
              // //         setState(() {
              // //           _passDataToParent('gender', 'Male');
              // //           _userGender = value;
              // //         });
              // //       },
              // //     ),
              // //     new GestureDetector(
              // //       onTap: () {
              // //         setState(() {
              // //           _passDataToParent('gender', 'Male');
              // //           _userGender = GenderEnum.male;
              // //         });
              // //       },
              // //       child: Text('Male'),
              // //     ),
              // //     SizedBox(
              // //       width: 20,
              // //     ),
              // //     Radio(
              // //       value: GenderEnum.female,
              // //       groupValue: _userGender,
              // //       onChanged: (GenderEnum value) {
              // //         setState(() {
              // //           _passDataToParent('gender', 'Female');
              // //           _userGender = value;
              // //         });
              // //       },
              // //     ),
              // //     new GestureDetector(
              // //       onTap: () {
              // //         setState(() {
              // //           _passDataToParent('gender', 'Female');
              // //           _userGender = GenderEnum.female;
              // //         });
              // //       },
              // //       child: Text('Female'),
              // //     ),
              // //   ],
              // // ),
              // // Divider(),
              // // SizedBox(
              // //   width: 360,
              // //   child: Row(
              // //     children: <Widget>[
              // //       Icon(
              // //         Icons.cake,
              // //         color: Colors.grey,
              // //       ),
              // //       Padding(
              // //         padding: const EdgeInsets.only(left: 14.0),
              // //         child: Container(
              // //           width: 260,
              // //           child: RaisedButton(
              // //             onPressed: () {
              // //               _selectDate(context);
              // //             },
              // //             child: Text(_selectDateString),
              // //             color: Colors.white,
              // //           ),
              // //         ),
              // //       ),
              // //     ],
              // //   ),
              // // ),
              // // Padding(
              // //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              // //   child: Row(
              // //     children: <Widget>[
              // //       Checkbox(
              // //         value: _agreedToTerm,
              // //         onChanged: _setAgreedToTerm,
              // //       ),
              // //       GestureDetector(
              // //         onTap: () => _setAgreedToTerm(!_agreedToTerm),
              // //         child: const Text(
              // //           'I agree to Terms & Conditions',
              // //         ),
              // //       ),
              // //     ],
              // //   ),
              // // ),
            ],
          ),
        ),
      ),
    );
  }

  void _passDataToParent(String key, dynamic value) {
    List<dynamic> addData = List<dynamic>();
    addData.add(key);
    addData.add(value);
    widget.parentAction(addData);
  }

  @override
  bool get wantKeepAlive => true;
}
