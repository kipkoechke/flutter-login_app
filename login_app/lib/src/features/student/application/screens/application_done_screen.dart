import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/screens/student_application_status.dart';

class ApplicationDoneScreen extends StatelessWidget {
  const ApplicationDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              " Your application was submited successfully",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                Get.to(() => StudentApplicationStatusScreen());
              },
              child: const Text('Application Status')),
        ],
      ),
    );
  }
}
