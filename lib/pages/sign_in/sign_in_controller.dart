// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  /// Controls the login procedure, using the [type] parameter to receive the login type:
  /// - google: Google account
  /// - apple: Apple account
  /// - facebook: Facebook account
  /// - email: Login with email and password.
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          ///
          toastInfo(msg: "You need to fill e-mail address");
          return;
        }

        if (password.isEmpty) {
          ///
          toastInfo(msg: "You need to fill password");
          return;
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if (credential.user == null) {
            ///
            toastInfo(msg: "You don't exists");
            return;
          }

          if (!credential.user!.emailVerified) {
            ///
            toastInfo(msg: "You need to verify your e-mail account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            /// We got verified user from Firebase Auth
            debugPrint("\nuser exists\n");

            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            /// We have error getting user from Firebase Auth
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "No user found for that e-mail");
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "Your e-mail address format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
