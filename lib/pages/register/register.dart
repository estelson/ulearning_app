import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(type: "Sign Up"),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: reusableText("Enter your details below & free sign up"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      buildTextField(
                        "Enter your user name",
                        "name",
                        "user",
                        (value) {
                          // context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("E-mail"),
                      buildTextField(
                        "Enter your e-mail address",
                        "e-mail",
                        "user",
                            (value) {
                          // context.read<SignInBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("Password"),
                      buildTextField(
                        "Enter your password",
                        "password",
                        "lock",
                        (value) {
                          // context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                      reusableText("Re-enter your password"),
                      buildTextField(
                        "Re-enter password",
                        "password",
                        "lock",
                            (value) {
                          // context.read<SignInBloc>().add(PasswordEvent(value));
                        },
                      ),
                      reusableText("By creating an account you have to agree with our therms & conditions."),
                    ],
                  ),
                ),
                buildLogInAndRegButton(
                  "Sign up",
                  "register",
                  () {
                    Navigator.of(context).pushNamed("register");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
