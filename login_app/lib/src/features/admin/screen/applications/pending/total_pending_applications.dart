import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_screen.dart';

class TotalNumberOfPendingApplications extends StatelessWidget {
  const TotalNumberOfPendingApplications({
    super.key,
    required this.pendingApplicationsController,
  });

  final PendingApplicationsController pendingApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: pendingApplicationsController.getPendingApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final pendingApplicationsCount = snapshot.data!;
          return GestureDetector(
            onTap: () {
              Get.to(const PendingApplicationsScreen());
            },
            child: Card(
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Pending ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$pendingApplicationsCount',
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
