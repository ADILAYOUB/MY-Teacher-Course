import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myteacher/common/widgets/flutter_toast.dart';
import 'package:myteacher/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  //handle signin based on socail or email
  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        // as we access the state we can access the properties inside it
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(message: 'Please enter email');
        }
        if (password.isEmpty) {
          toastInfo(message: 'Please enter password');
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(message: 'User not found');
          }
          // user exists but didn't verify email
          if (!credential.user!.emailVerified) {
            toastInfo(message: 'Please verify your email');
          }
          var user = credential.user;
          if (user != null) {
            // we got the verified user from firebase
            print('===  user exits ');
          } else {
            toastInfo(message: 'Currently you are not user of this app');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(message: 'No user found for that email');
          } else if (e.code == 'wrong-password') {
            toastInfo(message: 'Wrong password entered');
          } else if (e.code == 'invalid-email') {
            toastInfo(message: 'Invalid email');
          }
        }
      }
    } catch (e) {}
  }
}
