import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/common/widgets/flutter_toast.dart';

import 'bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  void handleSignIn() async {
    final state = context.read<RegisterBloc>().state;
    // as we access the state we can access the properties inside it
    String userName = state.username;
    String emailAddress = state.email;
    String password = state.password;
    String confirmPassword = state.confirmpassword;

    if (userName.isEmpty) {
      toastInfo(message: 'Please enter user name');
      return;
    }
    if (emailAddress.isEmpty) {
      toastInfo(message: 'Please enter email');
      return;
    }
    if (password.isEmpty) {
      toastInfo(message: 'Please enter password');
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(message: 'Please enter confirm password');
      return;
    }
    if (password != confirmPassword) {
      toastInfo(message: 'Password does not match');
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(userName);
        toastInfo(
            message:
                'Verification email has been sent to you registered email');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'Email already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'Invalid email');
      }
    }
  }
}
