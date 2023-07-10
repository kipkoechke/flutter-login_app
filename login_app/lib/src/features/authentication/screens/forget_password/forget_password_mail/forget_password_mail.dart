import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/form/form_header_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController resetController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(bDefaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: bDefaultSize * 4,
                ),
                const FormHeaderWidget(
                  image: bForgetPasswordImage,
                  title: bForgetPassword,
                  subTitle: bForgetMailSubTitle,
                  textAlign: TextAlign.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30,
                ),
                const SizedBox(height: bFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: resetController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                          label: Text(bEmail),
                        ),
                      ),
                      const SizedBox(height: bFormHeight),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            FirebaseAuth.instance.sendPasswordResetEmail(
                                email: resetController.text);
                            Get.to(() => const OTPScreen());
                          },
                          child: const Text(bNext),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
