import 'package:flutter/material.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/features/authentication/screens/login/widgets/login_footer.dart';
import 'package:login_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:login_app/features/authentication/screens/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(bDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(),
                LoginForm(),
                LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
