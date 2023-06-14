import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/authentication/screens/signup/widgets/signup_footer.dart';
import 'package:login_app/src/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:login_app/src/features/authentication/screens/signup/widgets/signup_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(bDefaultSize),
            child: const Column(
              children: [
                SignupHeader(),
                SignUpForm(),
                SignUpFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
