import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_event.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_states.dart';
import 'package:myteacher/pages/sign_in/sign_in_controller.dart';

import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Log In'),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                signInOptions(context),
                Center(
                    child: reusableTect('or use your email account to login')),
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
                      reusableTect('Email'),
                      SizedBox(height: 5.h),
                      buildTextField(
                          'Enter your email address', 'email', 'user', (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableTect('Password'),
                      SizedBox(height: 5.h),
                      buildTextField('Enter your password ', 'password', 'lock',
                          (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                    ],
                  ),
                ),
                forgetPassword(),
                buildLoginandRegButton('Log In', 'login', () {
                  SignInController(context: context).handleSignIn('email');
                }),
                buildLoginandRegButton('Sign Up', 'register', () {
                  Navigator.of(context).pushNamed('register');
                }),
              ],
            )),
          ),
        ),
      );
    });
  }
}
