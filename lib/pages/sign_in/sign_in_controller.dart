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

        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}
        // check if user exists in firebase or not
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            //
          }
          // user exists but didn't verify email
          if (!credential.user!.emailVerified) {}
          var user = credential.user;
          if (user != null) {
            // we got the verified user from firebase
          } else {
            //error geting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
