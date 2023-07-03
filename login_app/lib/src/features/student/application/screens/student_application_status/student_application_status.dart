import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/screens/student_application_status/student_application_status_controller.dart';

class StudentApplicationStatusScreen extends StatelessWidget {
  const StudentApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentApplicationStatusController());

    return Center(
      child: FutureBuilder<String>(
        future: controller.displayAllocationStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the allocation status
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Display an error message if an error occurred while fetching the allocation status
            return const Text(
              'Error occurred while fetching allocation status',
              style: TextStyle(color: Colors.red),
            );
          } else {
            // Display the allocation status message
            String allocationStatus = snapshot.data!;
            // String statusMessage = disp(allocationStatus);
            return Text(
              allocationStatus,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            );
          }
        },
      ),
    );
  }
}
