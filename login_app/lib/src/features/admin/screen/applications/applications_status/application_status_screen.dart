import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_screen.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_screen.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_screen.dart';

class ApplicationStatusScreen extends StatelessWidget {
  final controller = Get.put(ApplicationStatusController());

  ApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            PendingApplicationsScreen(),
            ApprovedApplicationScreen(),
            DeclinedApplicationsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.pending),
              label: 'Pending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.approval),
              label: 'Approved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_circle),
              label: 'Declined',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex,
        ),
      ),
    );
  }
}
