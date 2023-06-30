import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/controllers/student_application_status_controller.dart';

class StudentApplicationStatusScreen extends StatelessWidget {
  final StudentApplicationStatusController controller =
      Get.put(StudentApplicationStatusController());

  StudentApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Status'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            'Application Status: $controller',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
