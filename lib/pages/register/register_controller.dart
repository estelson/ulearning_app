// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
    }

    if (email.isEmpty) {
      toastInfo(msg: "E-mail can not be empty");
    }

    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);

        toastInfo(msg: "An e-mail has been sent to your registered e-mail.\nTo activate it, please check your e-mail box and click on the link");

        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "The e-mail is already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Your e-mail is invalid");
      }
    }
  }
}
