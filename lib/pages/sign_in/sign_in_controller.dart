import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  //handle signin based on socail or email
  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;

        // as we access the state we can access the properties inside it
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          print('Email is empty');
        } else {
          print(' $emailAddress This is email');
        }
        if (password.isEmpty) {}
        // check if user exists in firebase or not
        print(' password is empty');
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            //
            print('user doesn\'t exists');
          }
          // user exists but didn't verify email
          if (!credential.user!.emailVerified) {
            print('user not verified ');
          }
          var user = credential.user;
          if (user != null) {
            // we got the verified user from firebase
            print('user exits ');
          } else {
            //error geting user from firebase
            print('no user');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('no user fount form the email');
          } else if (e.code == 'wrong-password') {
            print('wrong password provided form the user');
          } else if (e.code == 'invalid-email') {
            print('Invalid Email');
          }
        }
      }
    } catch (e) {}
  }
}
