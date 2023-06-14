import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:login_app/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(bDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bForgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              bForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: bFormHeight),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: bEmail,
              subtitle: bResetViaEMail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(height: bFormHeight),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: bPhoneNo,
              subtitle: bResetViaPhone,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordPhoneNoScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
