import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_screen.dart';

class TotalNumberOfDeclinedApplications extends StatelessWidget {
  const TotalNumberOfDeclinedApplications({
    super.key,
    required this.declinedApplicationsController,
  });

  final DeclinedApplicationsController declinedApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: declinedApplicationsController.getDeclinedApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final declinedApplicationsCount = snapshot.data!;
          return GestureDetector(
            onTap: () {
              Get.to(const DeclinedApplicationsScreen());
            },
            child: Card(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Declined ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$declinedApplicationsCount',
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
