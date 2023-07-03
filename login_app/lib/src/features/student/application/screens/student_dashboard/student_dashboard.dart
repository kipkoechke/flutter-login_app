import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/screens/student_application_form/application_form_screen.dart';
import 'package:login_app/src/features/student/application/screens/student_application_status/student_application_status.dart';
import 'package:login_app/src/features/student/application/screens/student_dashboard/student_dashboard_controller.dart';
import 'package:login_app/src/features/student/application/screens/student_home_page/application_screen.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentDashboardController());

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            HomePage(),
            StudentApplicationForm(),
            StudentApplicationStatusScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pending),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.approval),
              label: 'Application',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_circle),
              label: 'Status',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex,
        ),
      ),
    );
  }
}
