import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/application/screens/locality/locality_details_screen.dart';
import 'package:login_app/src/features/authentication/screens/profile/profile_screen.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Application Form'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const ProfileScreen());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bursary Application Form',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: bDefaultSize),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LocalityDetailsScreen());
                    },
                    child: const Text('Click to apply'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
