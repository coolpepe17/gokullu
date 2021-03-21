import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm(
      this.emailTextController,
      this.passwordTextController,
      this.confirmPasswordTextController,
      this.nameTextController,
      this.mobileTextController,
      this.addressTextController,
      // this.eContact1TextController,
      // this.ePhone1TextController,
      // this.eContact2TextController,
      // this.ePhone2TextController,
      this.parentAction);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController confirmPasswordTextController;
  final TextEditingController nameTextController;
  final TextEditingController mobileTextController;
  final TextEditingController addressTextController;
  // final TextEditingController eContact1TextController;
  // final TextEditingController ePhone1TextController;
  // final TextEditingController eContact2TextController;
  // final TextEditingController ePhone2TextController;

  final ValueChanged<List<dynamic>> parentAction;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<StatefulWidget> createState() => _SignUpForm();
}

// enum GenderEnum { male, female }

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
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
