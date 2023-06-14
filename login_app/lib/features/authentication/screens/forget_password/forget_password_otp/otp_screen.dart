import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(bDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bOtpTitle,
              style: GoogleFonts.montserrat(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 40),
            const Text(
              '${bOtpMessage}support@bellon.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              keyboardType: const TextInputType.numberWithOptions(),
              onSubmit: (value) {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(bNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
