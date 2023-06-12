import 'package:flutter/material.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widget.dart';

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
          appBar: buildAppBar(title: "Registration"),
          body: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register Screen"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
