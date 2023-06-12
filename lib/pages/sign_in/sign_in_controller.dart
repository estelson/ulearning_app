import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  /// Controls the login procedure, using the [type] parameter to receive the login type:
  /// - Google account
  /// - Apple account
  /// - Facebook account
  /// - Login with email and password.
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // final state = BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          ///
          debugPrint("\nemail is empty\n");
        }

        if (password.isEmpty) {
          ///
          debugPrint("\npassword is empty\n");
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

          if(credential.user == null) {
            ///
            debugPrint("\nuser does not exists\n");
          }

          if(!credential.user!.emailVerified) {
            ///
            debugPrint("\nemail not verified\n");
          }

          var user = credential.user;
          if(user != null) {
            /// We got verified user from Firebase Auth
            debugPrint("\nuser exists\n");
          } else {
            /// We have error getting user from Firebase Auth
            debugPrint("\nno user found\n");
          }
        } on FirebaseAuthException catch (e) {
          if(e.code == "user-not-found") {
            debugPrint("\nuser-not-found error: ${e.code}\n");
          } else if(e.code == "wrong-password") {
            debugPrint("\nwrong-password error: ${e.code}\n");
          } else if(e.code == "invalid-email") {
            debugPrint("\ninvalid-email error: ${e.code}\n");
          }
        }
      }
    } catch (e) {}
  }
}
