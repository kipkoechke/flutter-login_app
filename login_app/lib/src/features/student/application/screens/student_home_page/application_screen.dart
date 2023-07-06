import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
          title: const Text('Recent Bursaries'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const ProfileScreen());
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: bDefaultSize),
                const Text(
                  'Available Bursaries',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: Obx(
                    () {
                      if (bursaryController.bursaries.isEmpty) {
                        return const Center(
                          child: Text(
                            'No bursaries available',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: bursaryController.bursaries.length,
                          itemBuilder: (context, index) {
                            final bursary = bursaryController.bursaries[index];
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  bursaryController.setBursaryClicked(bursary);
                                  Get.to(() => const StudentApplicationForm());
                                },
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Title: ${bursary.title}"),
                                    const Divider(),
                                    Text(bursary.description),
                                    const Divider()
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Deadline: ${DateFormat('MMM dd, yyyy -  HH:mm a').format(bursary.deadline)}",
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          bursaryController
                                              .setBursaryClicked(bursary);
                                          Get.to(() =>
                                              const StudentApplicationForm());
                                        },
                                        child: const Text(
                                          'Proceed to apply',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
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
