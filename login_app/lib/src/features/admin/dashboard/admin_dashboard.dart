import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/admin/all_applications.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users_controller.dart';
import 'package:login_app/src/features/admin/screen/allocation/total_allocated_users.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_screen.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/total_approved_applications.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/total_applications.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/total_declined_applications.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/total_pending_applications.dart';
import 'package:login_app/src/features/admin/screen/bursaries/new_bursary.dart';
import 'package:login_app/src/features/student/application/controllers/student_details_controller.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final fcm = Get.put(FCMController());
    final pendingApplicationsController =
        Get.put(PendingApplicationsController());
    final approvedApplicationsController =
        Get.put(ApprovedApplicationController());
    final declinedApplicationsController =
        Get.put(DeclinedApplicationsController());
    final allApplicationsController = Get.put(StudentDetailsController());
    final allocatedUsersController = Get.put(AllocatedUsersController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Portal'),
          //  backgroundColor:
          //    bPrimaryColor, // Set the background color of the app bar
          actions: [
            IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      bSecondaryColor,
                      bPrimaryColor.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.dashboard_customize_rounded,
                      size: 48,
                      color: Colors
                          .white, // Set the color of the icon in the drawer header
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Text(
                      'Bursary Management',
                      style: TextStyle(
                          color: Colors
                              .white, // Set the color of the text in the drawer header
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Dashboard'),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('All Applications'),
                  onTap: () {
                    Get.to(() => const AllApplicationsScreen());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Beneficiaries'),
                  onTap: () {
                    Get.to(const AllocatedApplicationScreen());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Applications'),
                  onTap: () {
                    Get.to(ApplicationStatusScreen());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Bursaries'),
                  onTap: () {
                    Get.to(() => NewBursaryScreen());
                  },
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the Admin Dashboard!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     FCMController.to
              //         .sendPushMessage(fcm.deviceToken!, 'body', 'title');
              //   },
              //   child: const Text('Send Bursary'),
              // ),
              // FCMController.to.listenToForegroundMessages(),

              TotalNumberOfBeneficiaries(
                allocatedUsersController: allocatedUsersController,
              ),
              TotalNumberOfAllApplications(
                allApplicationsController: allApplicationsController,
              ),
              TotalNumberOfPendingApplications(
                pendingApplicationsController: pendingApplicationsController,
              ),
              TotalNumberOfApprovedApplications(
                approvedApplicationsController: approvedApplicationsController,
              ),
              TotalNumberOfDeclinedApplications(
                declinedApplicationsController: declinedApplicationsController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
