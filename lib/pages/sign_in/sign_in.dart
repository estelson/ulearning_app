import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildThirdPartyLogin(context),
            Center(
              child: reusableText("Or user your e-mail account to login"),
            ),
            Container(
              margin: EdgeInsets.only(top: 66.h),
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText("E-mail"),
                  buildTextField(
                    "E-mail",
                    "e-mail",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
