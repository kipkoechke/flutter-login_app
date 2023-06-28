import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/application_status_controller.dart';

class ApplicationStatusScreen extends StatelessWidget {
  final ApplicationStatusController controller =
      Get.put(ApplicationStatusController());

  ApplicationStatusScreen({super.key});

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
