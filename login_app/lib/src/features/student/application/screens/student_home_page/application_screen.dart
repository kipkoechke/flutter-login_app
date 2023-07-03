import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_controller.dart';
import 'package:login_app/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:login_app/src/features/student/application/screens/student_application_form/application_form_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bursaryController = Get.put(BursaryController());

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
                ElevatedButton(
                  onPressed: () async {
                    await bursaryController.fetchBursaries();
                    Get.to(() => const StudentApplicationForm());
                  },
                  child: const Text('Click to apply'),
                ),
                const SizedBox(height: bDefaultSize),
                const Text(
                  'Available Bursaries',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: bursaryController.bursaries.length,
                      itemBuilder: (context, index) {
                        final bursary = bursaryController.bursaries[index];
                        return Card(
                          child: ListTile(
                            title: Text(bursary.title),
                            subtitle: Text(bursary.deadline.toString()),
                          ),
                        );
                      },
                    ),
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
