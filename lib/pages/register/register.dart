import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar('Sign Up'),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: reusableTect('Enter your details & sign up for free')),
              Container(
                margin: EdgeInsets.only(
                  top: 36.h,
                ),
                padding: EdgeInsets.only(
                  left: 24.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableTect('User Name'),
                    buildTextField(
                        'Enter your User name', 'user', 'user', (value) {}),
                    reusableTect('Email'),
                    buildTextField('Enter your email address', 'email', 'user',
                        (value) {}),
                    reusableTect('Password'),
                    buildTextField(
                        'Enter your password ', 'password', 'lock', (value) {}),
                    reusableTect('Confirm Password'),
                    buildTextField('Re-enter password to confirm ',
                        'confirmpassword', 'lock', (value) {}),
                  ],
                ),
              ),
              buildLoginandRegButton('Sign Up', 'register', () {
                Navigator.of(context).pushNamed('register');
              }),
            ],
          )),
        ),
      ),
    );
  }
}
