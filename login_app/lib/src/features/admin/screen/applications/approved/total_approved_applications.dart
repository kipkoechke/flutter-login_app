import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_screen.dart';

class TotalNumberOfApprovedApplications extends StatelessWidget {
  const TotalNumberOfApprovedApplications({
    super.key,
    required this.approvedApplicationsController,
  });

  final ApprovedApplicationController approvedApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: approvedApplicationsController.getApprovedApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final approvedApplicationsCount = snapshot.data!;
          return GestureDetector(
            onTap: () {
              Get.to(const ApprovedApplicationScreen());
            },
            child: Card(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Approved ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$approvedApplicationsCount',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: const TextStyle(fontSize: 16),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
