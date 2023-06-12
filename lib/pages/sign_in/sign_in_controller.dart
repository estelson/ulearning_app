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
        }

        if (password.isEmpty) {
          ///
        }

        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
        } catch (e) {}
      }
    } catch (e) {}
  }
}
