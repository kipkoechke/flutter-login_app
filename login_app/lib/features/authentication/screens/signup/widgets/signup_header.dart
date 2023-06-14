import 'package:flutter/material.dart';
import 'package:login_app/common_widgets/form/form_header_widget.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/text_strings.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const FormHeaderWidget(
      image: bWelcomeScreenImage,
      title: bSignUpTitle,
      subtitle: bSignUpSubTitle,
    );
  }
}
