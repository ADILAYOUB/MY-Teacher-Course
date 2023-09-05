import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';
import 'register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
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
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child:
                        reusableTect('Enter your details & sign up for free')),
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
                      buildTextField('Enter your User name', 'user', 'user',
                          (value) {
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                      }),
                      reusableTect('Email'),
                      buildTextField(
                          'Enter your email address', 'email', 'user', (value) {
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      }),
                      reusableTect('Password'),
                      buildTextField('Enter your password ', 'password', 'lock',
                          (value) {
                        context.read<RegisterBloc>().add(PasswordEvent(value));
                      }),
                      reusableTect('Confirm Password'),
                      buildTextField(
                          'Re-enter password to confirm ', 'password', 'lock',
                          (value) {
                        context
                            .read<RegisterBloc>()
                            .add(ConfirmpasswordEvent(value));
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: reusableTect(
                      'By creating a account you agree to our terms & conditions'),
                ),
                buildLoginandRegButton('Sign Up', 'login', () {
                  RegisterController(context: context).handleSignIn();
                }),
              ],
            )),
          ),
        ),
      );
    });
  }
}
