import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/student/application/screens/student_application_status/student_application_status_controller.dart';

class StudentApplicationStatusScreen extends StatelessWidget {
  const StudentApplicationStatusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentApplicationStatusController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Status'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<String>(
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
                    return Text(
                      allocationStatus,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    );
                  }
                },
              ),
              const SizedBox(height: bDefaultSize),
              GetBuilder<StudentApplicationStatusController>(
                builder: (controller) {
                  if (controller.isApproved && controller.hasAllocatedAmount) {
                    return FutureBuilder<double>(
                      future: controller.getAllocatedUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Display a loading indicator while waiting for the allocated amount
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Display an error message if an error occurred while fetching the allocated amount
                          return const Text(
                            'Error occurred while fetching allocated amount',
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          // Display the allocated amount
                          final allocatedAmount = snapshot.data;
                          if (allocatedAmount != null) {
                            return Card(
                              child: ListTile(
                                title:
                                    Text('Allocated Amount: $allocatedAmount'),
                              ),
                            );
                          } else {
                            return const Text('No allocated amount found.');
                          }
                        }
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
